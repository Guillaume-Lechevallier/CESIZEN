import {Component} from '@angular/core';
import {MatButton} from '@angular/material/button';

@Component({
  selector: 'app-cookies',
  standalone: true,
  imports: [
    MatButton
  ],
  templateUrl: './cookies.component.html',
  styleUrl: './cookies.component.css'
})
export class CookiesComponent {
  setCookie(): void {
    // Stocker la valeur "True" dans le localStorage sous la clé "cookie"
    localStorage.setItem('cookie_accepted', 'True');

    // Actualiser la page
    location.reload();
  }

}
