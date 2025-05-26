import {Component, OnInit} from '@angular/core';
import {Dashboard_questionnaireComponent} from '../dashboard_questionnaire/dashboard_questionnaire.component';
import {DashboardTrackerComponent} from '../dashboard-tracker/dashboard-tracker.component';

@Component({
  selector: 'app-dashboard',
  standalone: true,
  imports: [
    Dashboard_questionnaireComponent,
    DashboardTrackerComponent
  ],
  templateUrl: './dashboard.component.html',
  styleUrl: './dashboard.component.css'
})
export class DashboardComponent implements OnInit{
  ngOnInit() {
    const token = localStorage.getItem('token');
    if (token){
      console.log(token);
    }
    else {location.href="/login";}
  }

}
