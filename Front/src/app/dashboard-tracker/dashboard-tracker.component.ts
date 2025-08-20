import { Component, OnInit } from '@angular/core';
import { HttpClient, HttpHeaders, HttpClientModule } from '@angular/common/http';
import { API } from '../app.config';
import { CommonModule } from '@angular/common';
import { NgChartsModule } from 'ng2-charts';
import { ChartType, ChartOptions } from 'chart.js';

interface EmotionMeta {
  couleur: string;
  emotion: string;
  emotion_texte: string;
}

@Component({
  selector: 'app-dashboard-tracker',
  standalone: true,
  imports: [CommonModule, NgChartsModule, HttpClientModule],
  templateUrl: './dashboard-tracker.component.html',
  styleUrl: './dashboard-tracker.component.css'
})
export class DashboardTrackerComponent implements OnInit {
  emotionsData: any[] = [];
  emotionMeta: { [emotion: string]: { couleur: string; texte: string } } = {};

  pieChartLabels: string[] = [];
  pieChartData: any[] = [];
  pieChartType: ChartType = 'pie';
  pieChartOptions: ChartOptions = { responsive: true };

  barChartLabels: string[] = [];
  barChartData: any[] = [];
  barChartType: ChartType = 'bar';
  barChartOptions: ChartOptions = { responsive: true };
  showBarChart = false;

  constructor(private http: HttpClient) {}

  ngOnInit() {
    this.fetchDashboardData();
  }

  fetchDashboardData() {
    const token = localStorage.getItem('token') || '';
    const headers = new HttpHeaders({ 'Token': token });

    this.http.get<any>(`${API}/user/get_dashboard_tracker`, { headers }).subscribe({
      next: data => {
        // Récupérer les métadonnées
        (data.emotion_list as EmotionMeta[]).forEach((item: EmotionMeta) => {
          this.emotionMeta[item.emotion] = {
            couleur: `#${item.couleur}`,
            texte: item.emotion_texte
          };
        });

        this.emotionsData = data.emotions;

        const emotionCounts: { [key: string]: number } = {};
        this.emotionsData.forEach((entry: any) => {
          const emotion = entry.emotion;
          emotionCounts[emotion] = (emotionCounts[emotion] || 0) + 1;
        });

        this.pieChartLabels = data.emotion_list.map((e: EmotionMeta) => this.emotionMeta[e.emotion].texte);
        const pieData = data.emotion_list.map((e: EmotionMeta) => emotionCounts[e.emotion] || 0);
        const backgroundColors = data.emotion_list.map((e: EmotionMeta) => `#${e.couleur}`);

        this.pieChartData = [{
          data: pieData,
          backgroundColor: backgroundColors
        }];
      },
      error: err => {
        console.error('Erreur lors de la récupération des données :', err);
      }
    });
  }

  onPieClick(event: any) {
    const clickedIndex = event.active?.[0]?.index;
    if (clickedIndex === undefined) return;

    const emotionTexte = this.pieChartLabels[clickedIndex];
    const emotionKey = Object.keys(this.emotionMeta).find(key => this.emotionMeta[key].texte === emotionTexte);
    if (!emotionKey) return;

    const filtered = this.emotionsData.filter(e => e.emotion === emotionKey);
    const subEmotionCounts: { [key: string]: number } = {};

    filtered.forEach((e: any) => {
      subEmotionCounts[e.sous_emotion] = (subEmotionCounts[e.sous_emotion] || 0) + 1;
    });

    this.barChartLabels = Object.keys(subEmotionCounts);
    this.barChartData = [{
      data: Object.values(subEmotionCounts),
      label: `Sous-émotions de ${this.emotionMeta[emotionKey].texte}`,
      backgroundColor: this.emotionMeta[emotionKey].couleur,
      borderColor: this.emotionMeta[emotionKey].couleur,
      borderWidth: 1
    }];

    this.showBarChart = true;
  }
}
