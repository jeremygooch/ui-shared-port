FROM nginx

COPY ./configs/502.html /etc/nginx/502.html
COPY ./configs/start-nginx.sh /start-nginx.sh

ENTRYPOINT /start-nginx.sh
# ENTRYPOINT ["tail", "-f", "/dev/null"]
