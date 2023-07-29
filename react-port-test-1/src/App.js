import logo from './logo.svg';
import './App.css';

const sessionStorageKey = 'my-session-data';
const localStorageKey = 'my-local-data';

function App() {
    return (<div>
		<h1>Hello from React Project 1</h1>
		<strong>Session Storage Data:</strong>
		<pre>{ sessionStorage.getItem(sessionStorageKey)}</pre>
		<strong>Local Storage Data:</strong>
		<pre>{ localStorage.getItem(localStorageKey)}</pre>
	    </div>);
}

export default App;
