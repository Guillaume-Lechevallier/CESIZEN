import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { MatSidenavModule } from '@angular/material/sidenav';
import { MatStepperModule } from '@angular/material/stepper';
import { MatInputModule } from '@angular/material/input';
import { MatButtonModule } from '@angular/material/button';
import { FormBuilder, FormGroup, ReactiveFormsModule, Validators } from '@angular/forms';
import { HttpClient, HttpClientModule } from '@angular/common/http';
import { API } from '../app.config';
import { DeviceDetectorService } from 'ngx-device-detector';
import {MatCheckbox} from '@angular/material/checkbox';

@Component({
  selector: 'app-createaccount',
  standalone: true,
  imports: [
    CommonModule,
    MatSidenavModule,
    MatStepperModule,
    MatInputModule,
    MatButtonModule,
    ReactiveFormsModule,
    HttpClientModule,
    MatCheckbox
  ],
  templateUrl: './createaccount.component.html',
  styleUrls: ['./createaccount.component.css']
})
export class CreateaccountComponent implements OnInit {
  isMobile: boolean;
  accountForm: FormGroup;

  constructor(
    private fb: FormBuilder,
    private http: HttpClient,
    private deviceService: DeviceDetectorService
  ) {
    const passwordRegex = /^(?=.*[A-Z])(?=(?:.*\d){2,})(?=(?:.*[@$!%*?.&]){2,}).{12,}$/;
    const emailRegex : RegExp = /(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4][0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9][0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])/;
    this.isMobile = this.deviceService.isMobile();

    this.accountForm = this.fb.group({
      firstName: ['', Validators.required],
      lastName: ['', Validators.required],
      dob: ['', Validators.required],
      sex: ['', Validators.required],
      email: ['', [Validators.required, Validators.pattern(emailRegex)]],
      password: ['', [Validators.required, Validators.pattern(passwordRegex)]],
        accepttermsandconditions: [false, Validators.requiredTrue]

    });
  }

  ngOnInit() {}

  get firstName() {
    return this.accountForm.get('firstName')!;
  }

  get lastName() {
    return this.accountForm.get('lastName')!;
  }

  get dob() {
    return this.accountForm.get('dob')!;
  }
  get email() {
    return this.accountForm.get('email')!;
  }

  get sex() {
    return this.accountForm.get('sex')!;
  }

  get password() {
    return this.accountForm.get('password')!;
  }
    get accepttermsandconditions() {
    return this.accountForm.get('password')!;
  }

  submit() {
    if (this.accountForm.valid) {
      const body = {
        firstName: this.firstName.value,
        lastName: this.lastName.value,
        email:this.email.value,
        dob: this.dob.value,
        sex: this.sex.value,
        password: this.password.value,
        accepttermsandconditions: [false, Validators.requiredTrue]  // <- ici

      };

      this.http.post(API + '/user/create_users', body).subscribe(
        (response: any) => {
          if (response.success === true) {
            window.alert(`Votre compte a bien été créé ! Vous allez être redirigé vers la page d'accueil.`);
            window.location.href = '/acceuil';
          } else {
            window.alert(`Erreur lors de la création du compte. Veuillez réessayer.`);
          }
        },
        (error) => {
          window.alert(`Erreur lors de la création du compte.\n\n`+error.error.message);
          console.error('Erreur : ', error);
        }
      );
    } else {
      alert('Veuillez remplir tous les champs correctement.');
    }
  }
}
