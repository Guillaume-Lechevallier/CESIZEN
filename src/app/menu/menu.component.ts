import {Component, OnInit} from '@angular/core';
import {MatGridList, MatGridTile} from '@angular/material/grid-list';
import {MatIcon, MatIconModule} from '@angular/material/icon';
import {MatButton} from '@angular/material/button';
import {NgForOf} from '@angular/common';
import {HttpClient, HttpClientModule} from '@angular/common/http';

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

  constructor(private http: HttpClient) {
  }

  getGridCols(): number {
    const width = window.innerWidth;
    if (width < 600) return 1;
    if (width < 960) return 2;
    if (width < 1280) return 3;
    return 4;
  }

  ngOnInit() {


  }

}
