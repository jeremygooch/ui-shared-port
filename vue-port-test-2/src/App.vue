<script setup lang="ts">
  const sessionStorageKey = 'my-session-data';
  const localStorageKey = 'my-local-data';
  const sessionStorage = window.sessionStorage;
  const localStorage = window.localStorage;
</script>

<template>
  <h1>Hello from Vue Port Test 2</h1>
  <p></p>
  <strong>Session Storage Data:</strong>
  <p></p>
  <pre>{{ sessionStorage.getItem(sessionStorageKey) }}</pre>
  <p></p>
  <strong>Local Storage Data:</strong>
  <p></p>
  <pre>{{ localStorage.getItem(localStorageKey) }}</pre>
</template>
