import { Component, ElementRef, Renderer2 } from '@angular/core';
import { MatIcon } from "@angular/material/icon";
import {NgClass, NgForOf, NgIf} from "@angular/common";
import { HttpClient, HttpClientModule, HttpHeaders } from '@angular/common/http';
import { DomSanitizer, SafeHtml } from '@angular/platform-browser';
import { API, FRONT } from '../app.config';
import Toastify from 'toastify-js';
import {Router} from '@angular/router';

@Component({
  selector: 'app-favorite-info',
  standalone: true,
  imports: [
    MatIcon,
    NgForOf,
    NgIf,
    HttpClientModule,
    NgClass
  ],
  templateUrl: './favorite-info.component.html',
  styleUrl: './favorite-info.component.css'
})
export class FavoriteInfoComponent {

  posts: any[] = [];
  isLoading: boolean = false;

  constructor(
    private http: HttpClient,
    private sanitizer: DomSanitizer,
    private renderer: Renderer2,
    private el: ElementRef,
            private router: Router

  ) {}

  ngOnInit() {
    this.fetchFavoritePosts();
  }

  fetchFavoritePosts() {
    const token = localStorage.getItem('token');
    if (!token) return;

    const headers = new HttpHeaders().set('token', token);
    this.isLoading = true;

    this.http.get<any[]>(API + '/content/favorite', { headers }).subscribe(
      posts => {
        if (Array.isArray(posts)) {
          this.posts = posts.map(post => ({
            id: post.id,
            name: post.name,
            profilePic: post.profile_pic,
            content: this.sanitizeHtml(post.content),
            timestamp: post.created_at ? new Date(post.created_at) : new Date(),
            is_favorite: true  // tous les posts ici sont favoris à l'origine
          }));

          setTimeout(() => {
            this.posts.forEach(post => this.addEventListeners(post.id));
          }, 0);
        }
        this.isLoading = false;
      },
      error => {
        console.error("Erreur lors de la récupération :", error);
        this.isLoading = false;
      }
    );
  }

  sanitizeHtml(html: string): SafeHtml {
    return this.sanitizer.bypassSecurityTrustHtml(html);
  }

  addEventListeners(postId: number) {
    const container = this.el.nativeElement.querySelector(`#post-${postId}`);
    if (!container) return;

    const buttons = container.querySelectorAll('.dynamic-btn');
    buttons.forEach((btn: HTMLElement) => {
      this.renderer.listen(btn, 'click', () => {
        // Ajoute une action si nécessaire
      });
    });
  }

  getTimeElapsed(postDate: Date): string {
    const now = new Date();
    const diffMs = now.getTime() - new Date(postDate).getTime();
    const diffMinutes = Math.floor(diffMs / (1000 * 60));
    const diffHours = Math.floor(diffMinutes / 60);
    const diffDays = Math.floor(diffHours / 24);

    if (diffMinutes < 1) return "À l'instant";
    if (diffMinutes < 60) return `Il y a ${diffMinutes} min`;
    if (diffHours < 24) return `Il y a ${diffHours} h`;
    return `Il y a ${diffDays} jour${diffDays > 1 ? 's' : ''}`;
  }

  copyurl(id: string) {
    const text = FRONT + 'feed/' + id;
    navigator.clipboard.writeText(text).then(() => {
      Toastify({
        text: "Texte copié dans le presse-papier, vous pouvez le partager !",
        duration: 3000,
        gravity: "bottom",
        position: "center",
        className: "toastify-custom-bottom-center",
      }).showToast();
    }).catch(err => {
      Toastify({
        text: 'Erreur lors de la copie',
        duration: 3000,
        gravity: "bottom",
        position: "center",
        className: "toastify-custom-bottom-center",
      }).showToast();
    });
  }

  favorite(post: any) {
    const token = localStorage.getItem('token');
    if (!token) {
      Toastify({
        text: "Vous devez être connecté pour modifier les favoris.",
        duration: 3000,
        gravity: "bottom",
        position: "center",
        className: "toastify-custom-bottom-center",
      }).showToast();
      return;
    }

    this.http.post<{ is_favorite: boolean }>(`${API}/content/toggle_favorite/${post.id}`, {}, {
      headers: { token }
    }).subscribe(
      response => {
        post.is_favorite = response.is_favorite;

        Toastify({
          text: response.is_favorite ? "Ajouté aux favoris" : "Retiré des favoris",
          duration: 3000,
          gravity: "bottom",
          position: "center",
          className: "toastify-custom-bottom-center",
        }).showToast();

        // Si l'utilisateur retire un favori dans la vue "favorites", on l'enlève du tableau
        if (!response.is_favorite) {
          this.posts = this.posts.filter(p => p.id !== post.id);
        }
      },
      error => {
        console.error("Erreur lors du changement de favori :", error);
      }
    );
  }
  navigate(path: string) {
    this.router.navigate([path]);
  }
}
