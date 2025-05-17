import { Component } from '@angular/core';
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
export class DashboardComponent {

}
