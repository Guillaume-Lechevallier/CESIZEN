import {Component, OnInit} from '@angular/core';
import {MatGridList, MatGridTile} from '@angular/material/grid-list';
import {MatIcon, MatIconModule} from '@angular/material/icon';
import {MatButton} from '@angular/material/button';
import {NgForOf} from '@angular/common';
import {HttpClient, HttpClientModule, HttpHeaders} from '@angular/common/http';
import {API} from '../app.config';

@Component({
  selector: 'app-menu',
  standalone: true,
  imports: [
    MatGridList,
    MatGridTile,
    MatIcon,
    MatButton,
    NgForOf,
    MatIconModule,
    HttpClientModule,
  ],
  templateUrl: './menu.component.html',
  styleUrl: './menu.component.css'
})
export class MenuComponent implements OnInit {
  buttons = [
    {label: '🌬️ Mes exercices de respirations', lien: 'exercicederespiration'},
    {label: '📝 Mon questionnaire', lien: 'questionnaire'},
    {label: '😊 Déclarer une émotion', lien: 'declarer_une_emotion'},
    {label: '📖 Consulter les articles', lien: 'mon_feed'},
    {label: '📊 Mon tableau de bord', lien: 'mon_tableau_de_bord'},
    {label: '⚠️ Signaler un incident', lien: 'signal'}
  ];
  connected: boolean = false;
  constructor(private http: HttpClient) {
  }


  ngOnInit() {
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
this.buttons= [
    {label: '🌬️ Mes exercices de respirations', lien: 'exercicederespiration'},
    {label: '📝 Vous devez vous connecter pour accéder au questionnaire', lien: 'login'},
    {label: '😊 Vous devez vous connecter pour déclarer une émotion', lien: 'login'},
    {label: '📖 Consulter les articles', lien: 'mon_feed'},
    {label: '📊 Vous devez vous connecter pour accéder au tableau de bord', lien: 'login'},
    {label: '⚠️ Signaler un incident', lien: 'signal'}
  ];
          }
        })
    } else {
      this.connected = false;
      this.buttons= [
    {label: '🌬️ Mes exercices de respirations', lien: 'exercicederespiration'},
    {label: '📝 Vous devez vous connecter pour accéder au questionnaire', lien: 'login'},
    {label: '😊 Vous devez vous connecter pour déclarer une émotion', lien: 'login'},
    {label: '📖 Consulter les articles', lien: 'mon_feed'},
    {label: '📊 Vous devez vous connecter pour accéder au tableau de bord', lien: 'login'},
    {label: '⚠️ Signaler un incident', lien: 'signal'}
  ];

    }
    console.log(this.connected);

  }

}
