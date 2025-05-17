import {Component, OnInit} from '@angular/core';
import {API} from '../app.config';
import {catchError, throwError} from 'rxjs';
import {HttpClient} from '@angular/common/http';
import {Router} from '@angular/router';


@Component({
  selector: 'app-serverdown',
  standalone: true,
  imports: [],
  templateUrl: './serverdown.component.html',
  styleUrl: './serverdown.component.css'
})

export class ServerdownComponent implements OnInit {
  private reponse: any;

  constructor(private http: HttpClient, private router: Router) {
  } // Ajout de Router dans le constructeur

  ngOnInit() {
    this.http.get(API + '/check_server').pipe(
      catchError((error) => {
        console.error('Erreur détectée :', error);
        location.href = '/serveur_is_down'; // Redirection vers Google si le serveur est injoignable
        return throwError(() => new Error('Serveur indisponible.'));
      })
    ).subscribe(
      (response: any) => {
        this.reponse = response;

        if (this.reponse === 'True') {
          location.href = '/acceuil'; // Redirection si le serveur retourne une réponse inattendue
        }
      }
    );
  }
}
