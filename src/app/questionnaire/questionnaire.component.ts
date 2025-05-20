import {Component, OnInit} from '@angular/core';
import {HttpClient, HttpClientModule, HttpHeaders} from '@angular/common/http';
import {NgClass, NgIf} from '@angular/common';
import {API} from '../app.config';

@Component({
  selector: 'app-questionnaire',
  standalone: true,
  templateUrl: './questionnaire.component.html',
  styleUrls: ['./questionnaire.component.css'],
  imports: [HttpClientModule, NgIf, NgClass]
})
export class QuestionnaireComponent implements OnInit {
  steps: string[] = [
    'Bienvenu sur le Questionnaire de Holmes et Rahe',
    'Il sert à obtenir un apercue de votre stresse actuel, basé sur une année',
    "Le questionnaire est censé être répondu au moins une fois par ans afin d'avoir les évènements qui vous sont arrivé",
    "Répondez avec sincéritée afin d'avoir des résultats précis"
  ];

  questions: any[] = [];
  responses: number[] = [];
  currentIndex: number = 0;
  animationClass: string = 'fade-in';
  isTransitioning: boolean = false;
  showResults: boolean = false;
  finalScore: string = "";
  apiUrl = API + '/content/get_questions';

  constructor(private http: HttpClient) {
  }

  ngOnInit() {
    this.fetchQuestions();
  }

fetchQuestions() {
  const token = localStorage.getItem('token') ?? null;
  if (token !== null) {
    const headers = new HttpHeaders({
      'Token': token
    });

    this.http.get<any[]>(this.apiUrl, { headers }).subscribe(data => {
      // Vérifie si c'est une réponse de résultats déjà disponibles
      const hasScore = data.find(item => item.score !== undefined);
      const hasDate = data.find(item => item.prochaine_date !== undefined);
      const hasHtml = data.find(item => item.retour_html !== undefined);

      if (hasScore && hasDate && hasHtml) {
        console.log("aaa")

        this.finalScore = hasHtml.retour_html;

        this.showResults = true;
        // Tu peux stocker les autres valeurs si tu veux les afficher
        console.log("Score:", hasScore.score);

        console.log("Prochaine session:", hasDate.prochaine_date);
      } else {
        console.log("aaa")
        // Sinon, on est sur un questionnaire normal
        this.questions = data;
        this.responses = new Array(this.questions.length).fill(0);
        console.log(data)
      }
    });
  }else{
    console.log("aaaaaaaaaa");
        this.http.get<any[]>(this.apiUrl).subscribe(data => {
      // Vérifie si c'est une réponse de résultats déjà disponibles
      const hasScore = data.find(item => item.score !== undefined);
      const hasDate = data.find(item => item.prochaine_date !== undefined);
      const hasHtml = data.find(item => item.retour_html !== undefined);

      if (hasScore && hasDate && hasHtml) {
        console.log("aaa")

        this.finalScore = hasHtml.retour_html;

        this.showResults = true;
        // Tu peux stocker les autres valeurs si tu veux les afficher
        console.log("Score:", hasScore.score);

        console.log("Prochaine session:", hasDate.prochaine_date);
      } else {
        console.log("aaa")
        // Sinon, on est sur un questionnaire normal
        this.questions = data;
        this.responses = new Array(this.questions.length).fill(0);
        console.log(data)
      }
    });
  }
}


  increaseResponse() {
    if (this.currentIndex >= this.steps.length) {
      this.responses[this.currentIndex - this.steps.length]++;
    }
  }

  decreaseResponse() {
    if (this.currentIndex >= this.steps.length && this.responses[this.currentIndex - this.steps.length] > 0) {
      this.responses[this.currentIndex - this.steps.length]--;
    }
  }

  next() {
    if (!this.isTransitioning && this.currentIndex < this.steps.length + this.questions.length - 1) {
      this.isTransitioning = true;
      this.animationClass = 'slide-out-left';
      setTimeout(() => {
        this.currentIndex++;
        this.animationClass = 'slide-in-right';
        setTimeout(() => {
          this.animationClass = '';
          this.isTransitioning = false;
        }, 500);
      }, 500);
    }
  }

  prev() {
    if (!this.isTransitioning && this.currentIndex > 0) {
      this.isTransitioning = true;
      this.animationClass = 'slide-out-right';
      setTimeout(() => {
        this.currentIndex--;
        this.animationClass = 'slide-in-left';
        setTimeout(() => {
          this.animationClass = '';
          this.isTransitioning = false;
        }, 500);
      }, 500);
    }
  }

  finish() {
    const results = this.questions.map((q, index) => ({
      id: q.id,
      response: this.responses[index]
    }));

    // Récupérer le token depuis le localStorage
    const token = localStorage.getItem('token');

    // Définir les headers avec le token
    const headers = new HttpHeaders({
      'Content-Type': 'application/json',
      'Token': token || '' // Mettre un token vide si non trouvé
    });
    console.log(token)

    this.http.get(`${API}/content/submit_results`, {
      params: {data: JSON.stringify(results)},
      headers: headers
    }).subscribe(response => {
      this.finalScore = response as string;
      this.showResults = true;
    }, error => {
      this.finalScore = "error";
    });
  }
}
