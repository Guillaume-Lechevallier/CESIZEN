import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { CommonModule } from '@angular/common';
import { HttpClient, HttpClientModule, HttpHeaders } from '@angular/common/http';
import { API } from '../app.config';
import { catchError, of, timeout, switchMap } from 'rxjs';
import { Router } from '@angular/router';

@Component({
  selector: 'app-loginpage',
  standalone: true,
  imports: [
    FormsModule, CommonModule, HttpClientModule
  ],
  templateUrl: './loginpage.component.html',
  styleUrl: './loginpage.component.css'
})
export class LoginpageComponent implements OnInit {
  @Input() connected!: string;
  @Input() login!: string;
  @Input() password!: string;

  @Output() formSubmitted = new EventEmitter<{ login: string; password: string }>();

  logosrc = API + "/files/icongreen.png";

  constructor(private http: HttpClient, private router: Router) {}

  ngOnInit(): void {
    // Vérifie si le serveur est disponible via /check_server
    this.http.get(API + '/check_server').pipe(
  timeout(5000),
  catchError((error: any) => {

      location.href = "/serveur_is_down";

    return of(null);
  })
).subscribe();


    // Vérifie la session utilisateur
    const token = localStorage.getItem('token');
    if (token) {
      const headers = new HttpHeaders().set('token', token);
      this.http.get(API + 'auth/auth_by_token', { headers }).subscribe(
        (response: any) => {
          if (response === true) {
            this.router.navigate(['accueil']);
          } else {
            const expiredMsg = document.getElementById('sessionexpired');
            if (expiredMsg) expiredMsg.classList.replace('hidden', 'visible');
            localStorage.removeItem('token');
          }
        },
        () => {
          localStorage.removeItem('token');
        }
      );
    }
  }

  valider(): void {
    if (!this.login || !this.password) {
      const errorMsg = document.getElementById('motdepasseincorrect');
      if (errorMsg) errorMsg.classList.replace('hidden', 'visible');
      return;
    }

    const headers = new HttpHeaders()
      .set('email', this.login)
      .set('password', this.password);

    this.http.get(API + 'auth/auth_by_password', { headers }).pipe(
      switchMap((response: any) => {
        if (response.auth === true) {
          localStorage.setItem('token', response.token);
          const tokenHeaders = new HttpHeaders().set('token', response.token);
          return "ok";
        } else {
          const errorMsg = document.getElementById('motdepasseincorrect');
          if (errorMsg) errorMsg.classList.replace('hidden', 'visible');

          const expiredMsg = document.getElementById('sessionexpired');
          if (expiredMsg) expiredMsg.classList.replace('visible', 'hidden');
          return of(null);
        }
      })
    ).subscribe((coachResponse: any) => {
      if (coachResponse !== null) {
        this.router.navigate(['accueil']);
      }
    }, (error) => {
      console.error('Erreur : ', error);
    });
  }
}
