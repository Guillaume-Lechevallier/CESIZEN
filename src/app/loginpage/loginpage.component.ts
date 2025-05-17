import {Component, EventEmitter, Input, OnInit, Output} from '@angular/core';
import {FormsModule} from '@angular/forms';
import {CommonModule} from '@angular/common';
import {HttpClient, HttpClientModule, HttpHeaders} from '@angular/common/http';
import {API} from '../app.config';

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
  // Émettre les valeurs au composant parent
  @Output() formSubmitted = new EventEmitter<{ login: string; password: string }>();
  logosrc = API + "/files/icongreen.png";

  constructor(private http: HttpClient) {
  }

  ngOnInit(): void {
    const token = localStorage.getItem('token');
    if (token !== null) {
      const headers = new HttpHeaders()
        .set('token', token);
      this.http.get(API + 'auth/auth_by_token', {headers}).subscribe(
        (response: any) => {

          if (response === true) {
            window.location.href = 'accueil';
          } else {
            document.getElementById('sessionexpired')!.classList.replace('hidden', 'visible');
            localStorage.removeItem('token');
          }
        })
    } else {

    }

  }

  // Méthode pour valider et émettre les valeurs

  valider() {
    // Les headers que tu veux ajouter
    const headers = new HttpHeaders()
      .set('email', this.login)
      .set('password', this.password);

    // Effectuer une requête GET avec les headers
    this.http.get(API + 'auth/auth_by_password', {headers}).subscribe(
      (response: any) => {

        if (response.auth == true) {
          localStorage.setItem('token', response.token);
          window.location.href = '/acceuil';


          const headers = new HttpHeaders()
            .set('token', response.token);
          console.log(API)
          this.http.get(API + '/get_coach_position', {headers}).subscribe(
            (response: any) => {

              window.location.href = 'accueil';

            })
          console.log(response.auth)

        } else {
          document.getElementById('motdepasseincorrect')!.classList.replace('hidden', 'visible');
          document.getElementById('sessionexpired')!.classList.replace('visible', 'hidden');
        }
      },

      (error) => {

        console.error('Erreur : ', error);
      }
    );

  }
}
