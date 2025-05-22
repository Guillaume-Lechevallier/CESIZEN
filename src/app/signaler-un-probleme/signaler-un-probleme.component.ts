import { Component } from '@angular/core';
import { FormsModule } from '@angular/forms';

@Component({
  selector: 'app-signaler-un-probleme',
  standalone: true,
  imports: [FormsModule],
  templateUrl: './signaler-un-probleme.component.html',
  styleUrl: './signaler-un-probleme.component.css'
})
export class SignalerUnProblemeComponent {
  problemeTitre: string = '';
  problemeDescription: string = '';
  autoriseConsultation: boolean = false;
}
