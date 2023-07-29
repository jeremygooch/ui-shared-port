import { Component } from '@angular/core';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent {
  title = 'angular-port-test-2';

  sessionStorage = sessionStorage;
  localStorage = localStorage;

  sessionStorageKey = 'my-session-data';
  localStorageKey = 'my-local-data';
}
