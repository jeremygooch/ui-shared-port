import { Component } from '@angular/core';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent {
  title = 'angular-port-test-1';
  sessionStorage = sessionStorage;
  localStorage = localStorage;

  sessionStorageKey = 'my-session-data';
  localStorageKey = 'my-local-data';

  private readonly sensitiveSessionData = {
    userId: '123-456-789',
    otherData: [1,2,3,4,5]
  };

  private readonly sensitiveLocalData = {
    userId: '987-654-321',
    otherData: [5,4,3,2,1]
  };

  constructor() {
    this.sessionStorage.setItem(this.sessionStorageKey, JSON.stringify(this.sensitiveSessionData));
    this.localStorage.setItem(this.localStorageKey, JSON.stringify(this.sensitiveLocalData));
  }
}
