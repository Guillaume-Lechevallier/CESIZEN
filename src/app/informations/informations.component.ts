import { Component, ElementRef, HostListener, OnInit, Renderer2 } from '@angular/core';
import { HttpClient, HttpClientModule, HttpHeaders } from '@angular/common/http';
import {NgClass, NgFor, NgIf} from '@angular/common';
import { DomSanitizer, SafeHtml } from '@angular/platform-browser';
import { API, FRONT } from '../app.config';
import { MatIcon } from '@angular/material/icon';
import Toastify from 'toastify-js';
import {Router} from '@angular/router';

@Component({
  selector: 'app-informations',
  standalone: true,
  imports: [NgFor, HttpClientModule, NgIf, MatIcon, NgClass],
  templateUrl: './informations.component.html',
  styleUrls: ['./informations.component.css']
})
export class InformationsComponent implements OnInit {
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
    this.loadInitialPosts(5);
  }

  loadInitialPosts(count: number) {
    let loaded = 0;
    const loadNextPost = () => {
      if (loaded < count) {
        this.fetchRandomPost(() => {
          loaded++;
          loadNextPost();
        });
      }
    };
    loadNextPost();
  }

  fetchRandomPost(callback?: () => void) {
    if (this.isLoading) return;

    this.isLoading = true;
    const token = localStorage.getItem('token');
    const headers = token ? { headers: new HttpHeaders().set('token', token) } : {};

    this.http.get<any>(API + '/content/information', headers).subscribe(
      post => {
        if (post) {
          this.posts.push({
            id: post.id,
            name: post.name,
            profilePic: post.profile_pic,
            content: this.sanitizeHtml(post.content),
            timestamp: post.created_at ? new Date(post.created_at) : new Date(),
            is_favorite: post.is_favorite ?? false
          });
          setTimeout(() => this.addEventListeners(post.id), 0);
        }
        this.isLoading = false;
        if (callback) callback();
      },
      error => {
        console.error("Erreur lors de la récupération :", error);
        this.isLoading = false;
        if (callback) callback();
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
        // Ajoute ici si besoin
      });
    });
  }

  @HostListener('window:scroll', [])
  onScroll(): void {
    const position = window.innerHeight + window.scrollY;
    const pageHeight = document.body.offsetHeight;
    if (position >= pageHeight - 100) {
      this.fetchRandomPost();
    }
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
        text: "Texte copié dans le presse-papier !",
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
        text: "Connectez-vous pour ajouter aux favoris.",
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
        const msg = response.is_favorite ? "Ajouté aux favoris" : "Retiré des favoris";
        Toastify({
          text: msg,
          duration: 3000,
          gravity: "bottom",
          position: "center",
          className: "toastify-custom-bottom-center",
        }).showToast();
      },
      error => {
        console.error("Erreur lors du toggle favori :", error);
      }
    );
  }

  navigate(path: string) {
    this.router.navigate([path]);
  }
}
