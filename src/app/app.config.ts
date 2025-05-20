import {ApplicationConfig, importProvidersFrom, provideZoneChangeDetection, isDevMode} from '@angular/core';
import {provideRouter} from '@angular/router';
import {BrowserAnimationsModule} from '@angular/platform-browser/animations';

import {routes} from './app.routes';
import { provideServiceWorker } from '@angular/service-worker';

export const appConfig: ApplicationConfig = {
  providers: [provideZoneChangeDetection({eventCoalescing: true}), provideRouter(routes), importProvidersFrom(BrowserAnimationsModule), provideServiceWorker('ngsw-worker.js', {
            enabled: !isDevMode(),
            registrationStrategy: 'registerWhenStable:30000'
          })]
};

export const API = 'https://cesizenapi.caen-training-formations.com/'
export const FRONT = 'https://cesizen.caen-training-formations.com/'
