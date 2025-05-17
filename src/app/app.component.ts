import {Component} from '@angular/core';
import {RouterOutlet} from '@angular/router';
import {CommonModule} from '@angular/common';
import {ToolbarComponent} from "./toolbar/toolbar.component";
import {FooterComponent} from './footer/footer.component';
import {CookiesComponent} from './cookies/cookies.component';

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [RouterOutlet, CommonModule, ToolbarComponent, FooterComponent, CookiesComponent],
  templateUrl: './app.component.html',
  styleUrl: './app.component.css'
})
export class AppComponent {
  title = 'untitled9';
  connected: string | undefined;
  isCookiesVisible: boolean = false; // Affiche les cookies par défaut

  ngOnInit() {
    const cookie = localStorage.getItem('cookie_accepted');
    if (cookie !== 'True') {
      this.isCookiesVisible = true;
    }

  }

}
