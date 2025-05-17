import {Component, OnInit} from '@angular/core';
import {ActivatedRoute} from '@angular/router';
import {HttpClient, HttpClientModule, HttpHeaders} from '@angular/common/http';
import {FormsModule} from '@angular/forms';
import {NgIf} from '@angular/common';
import {MatProgressSpinner} from '@angular/material/progress-spinner';
import {API} from '../app.config';

@Component({
  selector: 'app-reinitialisationpassword',
  standalone: true,
  imports: [
    HttpClientModule, FormsModule, NgIf, MatProgressSpinner,],
  templateUrl: './reinitialisationpassword.component.html',
  styleUrls: ['./reinitialisationpassword.component.css'],
})
export class ReinitialisationpasswordComponent implements OnInit {
  id: string | null = null; // ID récupéré depuis l'URL
  password: string = ''; // Mot de passe
  confirmPassword: string = ''; // Confirmation
  errorMessage: string = ''; // Message d'erreur
  successMessage: string = ''; // Message de succès
  isLoading: boolean = false; // Indique si la requête est en cours

  constructor(private route: ActivatedRoute, private http: HttpClient) {
  }

  ngOnInit(): void {
    // Récupération du paramètre ID
    this.id = this.route.snapshot.paramMap.get('id');
    // Debug
  }

  validatePassword(): void {
    // Exigences pour le mot de passe
    const passwordRegex = /^(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?.&])[A-Za-z\d@$!%*?.&]{12,}$/;

    if (this.password !== this.confirmPassword) {
      this.errorMessage = 'Les mots de passe ne correspondent pas.';
      this.successMessage = '';
    } else if (!passwordRegex.test(this.password)) {
      this.errorMessage =
        'Le mot de passe doit contenir au moins 12 caractères, une majuscule, un caractère spécial et un chiffre.';
      this.successMessage = '';
    } else {
      this.errorMessage = '';
      this.sendPasswordToApi();
    }
  }

  sendPasswordToApi(): void {
    if (!this.id) {
      this.errorMessage = 'ID utilisateur introuvable.';
      this.successMessage = '';
      return;
    }

    this.isLoading = true; // Démarrer le spinner

    // Construire les headers
    const headers = new HttpHeaders()
      .set('token', this.id!) // Insère l'ID utilisateur dans les headers
      .set('password', this.password); // Insère le mot de passe dans les headers

    // Envoyer une requête GET avec les headers
    this.http.get(API + `/reinitialisation-mot-de-passe`, {headers}).subscribe(
      (response: any) => {

        this.isLoading = false; // Arrêter le spinner

        // Vérifier la réponse de l'API
        this.successMessage = 'Votre mot de passe a été réinitialisé avec succès !';

      },
      (error) => {
        console.error('Erreur : ', error);
        this.isLoading = false; // Arrêter le spinner
        this.errorMessage = 'Une erreur est survenue lors de la réinitialisation.';
      }
    );
  }
}
