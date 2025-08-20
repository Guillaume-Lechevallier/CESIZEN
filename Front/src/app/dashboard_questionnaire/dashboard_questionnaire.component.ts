import { Component, OnInit } from '@angular/core';
import { HttpClient, HttpHeaders,HttpClientModule } from '@angular/common/http';
import { API } from '../app.config'; // Assure-toi que le chemin est bon
import { CommonModule } from '@angular/common';
import { NgChartsModule } from 'ng2-charts';
import { ChartOptions, ChartType } from 'chart.js';

@Component({
  selector: 'app-dashboard_questionnaire',
  standalone: true,
  imports: [CommonModule, NgChartsModule,HttpClientModule],
  templateUrl: './dashboard_questionnaire.component.html',
  styleUrls: ['./dashboard_questionnaire.component.css']
})
export class Dashboard_questionnaireComponent implements OnInit {
  chartData: { labels: string[], datasets: any[] } = { labels: [], datasets: [] };
  chartOptions: ChartOptions = {
    responsive: true,
    plugins: {
      legend: {
        display: false
      }
    }
  };

  constructor(private http: HttpClient) {}

  ngOnInit() {
    this.fetchDashboardData();
  }

  fetchDashboardData() {
    const token = localStorage.getItem('token') || '';

    const headers = new HttpHeaders({
      'Token': token
    });

    this.http.get<any>(`${API}/user/get_dashboard_questionnaire`, { headers }).subscribe(data => {
      const entries = data.resultatquestionnaire;

      const labels = entries.map((entry: any) =>
        new Date(entry.date_reponse).toLocaleDateString()
      );
      const scores = entries.map((entry: any) => entry.score);

      this.chartData = {
        labels: labels,
datasets: [
  {
    data: scores,
    label: 'Score du questionnaire',
    fill: true,
    tension: 0.3,
    borderColor: '#007bff',
    backgroundColor: 'rgba(0, 123, 255, 0.1)',
    pointBackgroundColor: '#007bff',
    pointBorderColor: '#fff',
    pointHoverBackgroundColor: '#fff',
    pointHoverBorderColor: '#007bff'
  }
]

      };
    });
  }
}
