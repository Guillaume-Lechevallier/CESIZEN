import {Component, OnInit} from '@angular/core';
import {CommonModule} from '@angular/common';
import {HttpClient, HttpClientModule} from '@angular/common/http';
import {FormsModule} from '@angular/forms';
import {API} from '../app.config';

interface BreathingStep {
  phase: string;
  size: number;
  duration: number;
}

interface BreathingExercise {
  id: number;
  name: string;
  steps: BreathingStep[];
}

@Component({
  selector: 'app-exercicederespiration',
  standalone: true,
  imports: [CommonModule, HttpClientModule, FormsModule],
  templateUrl: './exercicederespiration.component.html',
  styleUrl: './exercicederespiration.component.css',
})
export class ExercicederespirationComponent implements OnInit {
  exercises: BreathingExercise[] = [];
  selectedExercise: BreathingExercise | null = null;
  step: number = 1;
  breathingPhase: string = 'Choisissez un exercice';
  isRunning: boolean = false;
  isHidden: boolean = false;

  innerCircleSize1: number = 100;
  innerCircleSize2: number = 80;
  innerCircleSize3: number = 60;

  constructor(private http: HttpClient) {
  }

  ngOnInit() {
    this.loadExercises();
  }

  public proceedToExercise(): void {
    if (this.selectedExercise) {
      this.breathingPhase = 'Vous pouvez démarrer l exercice'; // 🔥 Reset du texte pour éviter qu'il reste affiché

      this.step = 2;
    }
  }

  public startBreathing(): void {
    if (!this.selectedExercise || this.isRunning) return;

    this.isRunning = true;
    this.isHidden = false;
    this.runCycle(0);
  }

  public stopBreathing(): void {
    this.breathingPhase = 'Vous pouvez démarrer l exercice'; // 🔥 Reset du texte pour éviter qu'il reste affiché

    if (!this.isRunning) return;

    this.isRunning = false;

    setTimeout(() => {
      this.isHidden = false;
    }, 500);
  }

  public returnToSelection(): void {
    this.step = 1;
    this.isRunning = false;
    this.isHidden = false;
    this.breathingPhase = 'Choisissez un exercice'; // 🔥 Reset du texte pour éviter qu'il reste affiché
  }

  private loadExercises(): void {
    this.http.get<{ exercice: BreathingExercise }[]>(API + `/content/breathing-exercises`).subscribe(
      (data) => {
        this.exercises = data.map(item => item.exercice);
        this.selectedExercise = this.exercises.length > 0 ? this.exercises[0] : null;
      },
      (error) => {
        console.error('Erreur lors du chargement des exercices :', error);
        this.exercises = [];
        this.selectedExercise = null;
      }
    );
  }

  private runCycle(index: number): void {
    if (!this.isRunning || !this.selectedExercise || !this.selectedExercise.steps || this.selectedExercise.steps.length === 0) return;

    const step = this.selectedExercise.steps[index];
    this.breathingPhase = step.phase;

    // Modifier dynamiquement la taille des cercles en fonction de l'étape
    this.innerCircleSize1 = step.size;
    this.innerCircleSize2 = step.size * 0.8;
    this.innerCircleSize3 = step.size * 0.6;

    setTimeout(() => {
      if (!this.selectedExercise || !this.selectedExercise.steps) return;
      const nextIndex = (index + 1) % this.selectedExercise.steps.length;
      this.runCycle(nextIndex);
    }, step.duration);
  }

}
