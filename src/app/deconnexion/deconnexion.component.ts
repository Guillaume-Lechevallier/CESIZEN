import {Component, OnInit} from '@angular/core';

@Component({
  selector: 'app-deconnexion',
  standalone: true,
  imports: [],
  templateUrl: './deconnexion.component.html',
  styleUrl: './deconnexion.component.css'
})
export class DeconnexionComponent implements OnInit {

  ngOnInit(): void {
    localStorage.removeItem('token');

  }
}
