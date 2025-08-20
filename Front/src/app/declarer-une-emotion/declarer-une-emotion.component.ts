import { Component, OnInit } from '@angular/core';
import { HttpClient, HttpClientModule, HttpHeaders } from '@angular/common/http';
import { CommonModule } from '@angular/common';
import { MatSelectModule } from '@angular/material/select';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { MatButtonModule } from '@angular/material/button';
import { API } from '../app.config';

@Component({
  selector: 'app-declarer-une-emotion',
  standalone: true,
  imports: [
    CommonModule,
    FormsModule,
    ReactiveFormsModule,
    MatSelectModule,
    MatButtonModule,
    HttpClientModule
  ],
  templateUrl: './declarer-une-emotion.component.html',
  styleUrls: ['./declarer-une-emotion.component.css']
})
export class DeclarerUneEmotionComponent implements OnInit {
  emotions: any[] = [];
  selectedEmotion: any = null;
  selectedSousEmotion: any = null;

  constructor(private http: HttpClient) {}

  ngOnInit() {
    this.loadEmotions();
  }

  loadEmotions() {
    const token = localStorage.getItem('token') || '';

    const headers = new HttpHeaders({
      'token': token
    });

    this.http.get<any[]>(API + '/content/get_emotion_list', { headers }).subscribe(data => {
      this.emotions = data.map(emotion => ({
        ...emotion,
        sous_emotion: emotion.sous_emotion
      }));
    });
  }

  submitEmotion() {
    if (!this.selectedEmotion || !this.selectedSousEmotion) {
      return;
    }

    const payload = {
      emotion: this.selectedEmotion.emotion,
      sous_emotion: this.selectedSousEmotion.nom
    };

    const token = localStorage.getItem('token') || '';

    const headers = new HttpHeaders({
      'Content-Type': 'application/json',
      'token': token
    });

    this.http.post(API + '/content/post_emotion', payload, { headers }).subscribe({
      next: response => {
        console.log('Émotion envoyée avec succès', response);
        alert('Émotion enregistrée !');

        // Réinitialiser les sélections
        this.selectedEmotion = null;
        this.selectedSousEmotion = null;

        // Recharger la liste des émotions
        this.loadEmotions();
      },
      error: err => {
        console.error("Erreur lors de l'envoi de l'émotion", err);
        alert('Erreur lors de l\'envoi.');
      }
    });
  }

  onEmotionChange() {
    this.selectedSousEmotion = null;
  }

  get sousEmotions() {
    return this.selectedEmotion ? this.selectedEmotion.sous_emotion : [];
  }
}
