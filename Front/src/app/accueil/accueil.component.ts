import {Component, OnInit} from '@angular/core';
import {CommonModule} from '@angular/common';
import {ToolbarComponent} from '../toolbar/toolbar.component';

import {HttpClientModule} from '@angular/common/http';
import {MenuComponent} from '../menu/menu.component';


@Component({
  selector: 'app-accueil',
  standalone: true,
  imports: [CommonModule, ToolbarComponent, HttpClientModule, HttpClientModule, MenuComponent],
  templateUrl: './accueil.component.html',
  styleUrls: ['./accueil.component.css']
})
export class AccueilComponent implements OnInit {
  ngOnInit() {

  }

}
