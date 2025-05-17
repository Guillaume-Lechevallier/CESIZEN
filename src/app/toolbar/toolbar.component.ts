import {Component, OnInit, ViewEncapsulation} from '@angular/core';
import {Router, RouterLink} from '@angular/router'; // Import pour la navigation
import {MatToolbar, MatToolbarRow} from '@angular/material/toolbar';
import {MatIcon} from '@angular/material/icon';
import {MatMenu, MatMenuItem, MatMenuTrigger} from '@angular/material/menu';
import {HttpClient, HttpClientModule, HttpHeaders} from '@angular/common/http';
import {NgIf} from '@angular/common';
import {API} from '../app.config';
import {MatButton} from '@angular/material/button';


@Component({
  selector: 'app-toolbar',
  standalone: true,
  imports: [
    MatToolbar,
    MatIcon,
    MatMenuTrigger,
    MatMenu,
    MatToolbarRow, HttpClientModule, NgIf, RouterLink, MatMenuItem, MatButton
  ],
  encapsulation: ViewEncapsulation.None, // Ajoutez cette ligne
  templateUrl: './toolbar.component.html',
  styleUrl: './toolbar.component.css'
})


export class ToolbarComponent implements OnInit {

  etatquestionnaire: any;
  role: any;
  // Méthode pour valider et émettre les valeurs
  logosrc = API + "/files/iconwhite.png";
  connected: boolean = false;
  private reponse: any;

  constructor(private http: HttpClient, private router: Router, private route: Router) {
  } // Ajout de Router dans le constructeur

  ngOnInit(): void {
    const token = localStorage.getItem('token');
    if (token !== null) {
      const headers = new HttpHeaders()
        .set('token', token);
      this.http.get(API + 'auth/auth_by_token', {headers}).subscribe(
        (response: any) => {
          if (response === true) {
            this.connected = true;
          } else {
            this.connected = false;
          }
        })
    } else {
      this.connected = false;

    }
    console.log(this.connected);
  }

  navigate(path: string) {
    this.router.navigate([path]);
  }
}
