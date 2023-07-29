<script>
  export const sessionStorageKey = 'my-session-data';
  export const localStorageKey = 'my-local-data';
</script>

<h1>Hello from Svelte Test 1</h1>
<strong>Session Storage Data</strong>
<pre>{ sessionStorage.getItem(sessionStorageKey) }</pre>
<strong>Local Storage Data</strong>
<pre>{ localStorage.getItem(localStorageKey) }</pre>