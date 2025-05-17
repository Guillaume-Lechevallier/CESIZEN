import { Component, ElementRef, OnInit, Renderer2 } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { HttpClient, HttpClientModule, HttpHeaders } from '@angular/common/http';
import {NgClass, NgIf} from '@angular/common';
import { DomSanitizer, SafeHtml } from '@angular/platform-browser';
import { API, FRONT } from '../app.config';
import { MatIcon } from '@angular/material/icon';
import Toastify from 'toastify-js';

@Component({
  selector: 'app-one-info',
  standalone: true,
  imports: [NgIf, HttpClientModule, MatIcon, NgClass],
  templateUrl: './one-info.component.html',
  styleUrls: ['./one-info.component.css'],
})
export class OneInfoComponent implements OnInit {
  post: any = null;
  isLoading: boolean = false;

  constructor(
    private route: ActivatedRoute,
    private http: HttpClient,
    private sanitizer: DomSanitizer,
    private renderer: Renderer2,
    private router: Router,
    private el: ElementRef
  ) {}

  ngOnInit(): void {
    const id = this.route.snapshot.paramMap.get('id');
    if (id) {
      this.fetchPostById(id);
    } else {
      console.warn("Aucun ID trouvé dans l'URL.");
    }
  }

  fetchPostById(id: string): void {
    this.isLoading = true;

    const token = localStorage.getItem('token');
    const headers = token ? { headers: new HttpHeaders().set('token', token) } : {};

    this.http.get<any>(`${API}/content/one_information/${id}`, headers).subscribe(
      post => {
        if (post) {
          this.post = {
            id: post.id,
            name: post.name,
            profilePic: post.profile_pic,
            content: this.sanitizeHtml(post.content),
            timestamp: post.created_at ? new Date(post.created_at) : new Date(),
            is_favorite: post.is_favorite,
          };

          setTimeout(() => this.addEventListeners(post.id), 0);
        }
        this.isLoading = false;
      },
      error => {
        console.error("Erreur lors de la récupération du post :", error);
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
        console.log(`Bouton cliqué dans le post ${postId}`);
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
      console.error('Erreur lors de la copie : ', err);
      Toastify({
        text: 'Erreur lors de la copie ',
        duration: 3000,
        gravity: "bottom",
        position: "center",
        className: "toastify-custom-bottom-center",
      }).showToast();
    });
  }

  favorite(id: string) {
    const token = localStorage.getItem('token');
    if (!token) {
      Toastify({
        text: "Vous devez être connecté pour ajouter aux favoris.",
        duration: 3000,
        gravity: "bottom",
        position: "center",
        className: "toastify-custom-bottom-center",
      }).showToast();
      return;
    }

    this.http.post<{ is_favorite: boolean }>(`${API}/content/toggle_favorite/${id}`, {}, {
      headers: { token }
    }).subscribe(
      response => {
        this.post.is_favorite = response.is_favorite;
        const message = response.is_favorite ? "Ajouté aux favoris" : "Retiré des favoris";
        Toastify({
          text: message,
          duration: 3000,
          gravity: "bottom",
          position: "center",
          className: "toastify-custom-bottom-center",
        }).showToast();
      },
      error => {
        console.error("Erreur lors du changement de favori :", error);
        Toastify({
          text: "Erreur lors de la mise à jour des favoris",
          duration: 3000,
          gravity: "bottom",
          position: "center",
          className: "toastify-custom-bottom-center",
        }).showToast();
      }
    );
  }

  navigate(path: string) {
    this.router.navigate([path]);
  }
}
