import { Component, OnInit } from '@angular/core';
import { HttpClient, HttpHeaders, HttpClientModule } from '@angular/common/http';
import { API } from '../app.config';
import { CommonModule } from '@angular/common';
import { NgChartsModule } from 'ng2-charts';
import { ChartType, ChartOptions } from 'chart.js';

@Component({
  selector: 'app-dashboard-tracker',
  standalone: true,
  imports: [CommonModule, NgChartsModule, HttpClientModule],
  templateUrl: './dashboard-tracker.component.html',
  styleUrl: './dashboard-tracker.component.css'
})
export class DashboardTrackerComponent implements OnInit {
  emotionsData: any[] = [];
  pieChartLabels: string[] = [];
  pieChartData: number[] = [];
  pieChartType: ChartType = 'pie';
  pieChartOptions: ChartOptions = { responsive: true };
  showBarChart = false;

  barChartLabels: string[] = [];
  barChartData: any[] = [];
  barChartType: ChartType = 'bar';
  barChartOptions: ChartOptions = { responsive: true };

  constructor(private http: HttpClient) {}

  ngOnInit() {
    this.fetchDashboardData();
  }

  fetchDashboardData() {
    const token = localStorage.getItem('token') || '';
    const headers = new HttpHeaders({ 'Token': token });

    this.http.get<any>(`${API}/user/get_dashboard_tracker`, { headers }).subscribe(data => {
      this.emotionsData = data.emotions;

      const emotionCounts: { [key: string]: number } = {};

      this.emotionsData.forEach((entry: any) => {
        const emotion = entry.emotion;
        emotionCounts[emotion] = (emotionCounts[emotion] || 0) + 1;
      });

      this.pieChartLabels = Object.keys(emotionCounts);
      this.pieChartData = Object.values(emotionCounts);
    });
  }

  onPieClick(event: any) {
    const clickedIndex = event.active[0]?.index;
    if (clickedIndex !== undefined) {
      const emotionClicked = this.pieChartLabels[clickedIndex];
      const filtered = this.emotionsData.filter(e => e.emotion === emotionClicked);

      const subEmotionCounts: { [key: string]: number } = {};
      filtered.forEach(e => {
        subEmotionCounts[e.sous_emotion] = (subEmotionCounts[e.sous_emotion] || 0) + 1;
      });

      this.barChartLabels = Object.keys(subEmotionCounts);
      this.barChartData = [{
        data: Object.values(subEmotionCounts),
        label: `Sous-émotions de ${emotionClicked}`,
        backgroundColor: 'rgba(54, 162, 235, 0.5)',
        borderColor: 'rgba(54, 162, 235, 1)',
        borderWidth: 1
      }];
      this.showBarChart = true;
    }
  }
}
