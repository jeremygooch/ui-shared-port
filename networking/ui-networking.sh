#!/bin/bash

destroy=false
rebuild=false
pause=false
resume=false
status=false
help=false

processed=false

while (( $# >= 1 )); do
    case $1 in
	--destroy) destroy=true;;
	--rebuild) rebuild=true;;
	--resume) resume=true;;
	--pause) pause=true;;
	--status) status=true;;
	--help) help=true;;
	*) break;
    esac;
    shift
done

if $help; then
    processed=true;
    cat readme.org
fi

if $status; then
    processed=true;
    containerId="$(docker ps -a -q --filter ancestor=ui-dev-networking --format="{{.ID}}")"
    containerStatus="$(docker inspect -f '{{.State.Status}}' $containerId)"
    echo "CONTAINER STATUS: [$containerStatus]"
    echo
    docker ps -a --filter ancestor=ui-dev-networking
    echo
    echo "IMAGE STATUS"
    docker images ui-dev-networking
fi

if [[ $destroy == true || $rebuild == true ]]; then
    processed=true
    container="$(docker ps -a -q --filter ancestor=ui-dev-networking --format="{{.ID}}")"
    echo "Stopping ui-dev-networking container ${container}..."
    docker container stop $container
    echo "Cleaning up images"
    docker rm $container
    docker rmi ui-dev-networking
    docker images prune

    if $rebuild; then
	echo "Building base image"
	docker build -t ui-dev-networking .
	docker compose up -d
    fi
fi

if $pause; then
    processed=true;
    echo "Stopping container"
    docker compose kill
    echo "You can now run any builds with no ports blocked. Press <enter> when you would like to resume the container"
    read $continue
    docker compose up -d
fi

if $resume; then
    processed=true;
    echo "Resuming container"
    docker compose up -d
fi


if [[ $processed == false ]]; then
    if [[ "$(docker image inspect ui-dev-networking:latest 2> /dev/null)" == [] ]]; then
	echo "Building base image"
	docker build -t ui-dev-networking .
	docker compose up -d
    else
	echo "Container is already running"
    fi
fi
