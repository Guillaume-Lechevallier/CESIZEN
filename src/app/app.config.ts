import {ApplicationConfig, importProvidersFrom, provideZoneChangeDetection} from '@angular/core';
import {provideRouter} from '@angular/router';
import {BrowserAnimationsModule} from '@angular/platform-browser/animations';

import {routes} from './app.routes';

export const appConfig: ApplicationConfig = {
  providers: [provideZoneChangeDetection({eventCoalescing: true}), provideRouter(routes), importProvidersFrom(BrowserAnimationsModule)]
};

export const API = 'http://guillaume-lechevallier.freeboxos.fr:5000/'
export const FRONT = 'http://guillaume-lechevallier.freeboxos.fr:4200/'
