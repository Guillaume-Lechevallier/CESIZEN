import {RouterModule, Routes} from '@angular/router';
import {LoginpageComponent} from './loginpage/loginpage.component';

import {AccueilComponent} from './accueil/accueil.component';
import {ServerdownComponent} from './serverdown/serverdown.component';
import {DeconnexionComponent} from './deconnexion/deconnexion.component';
import {ReinitialisationpasswordComponent} from './reinitialisationpassword/reinitialisationpassword.component';
import {CreateaccountComponent} from './createaccount/createaccount.component';
import {PolitiquegestiondedonneesComponent} from './politiquegestiondedonnees/politiquegestiondedonnees.component';
import {ContactComponent} from './contact/contact.component';
import {ExercicederespirationComponent} from './exercicederespiration/exercicederespiration.component';
import {InformationsComponent} from './informations/informations.component';
import {OneInfoComponent} from './one-info/one-info.component';
import {QuestionnaireComponent} from './questionnaire/questionnaire.component';
import {FavoriteInfoComponent} from './favorite-info/favorite-info.component';
import {DashboardComponent} from './dashboard/dashboard.component';
import {DeclarerUneEmotionComponent} from './declarer-une-emotion/declarer-une-emotion.component';

export const routes: Routes = [
  {path: 'login', component: LoginpageComponent},
  {path: 'serveur_is_down', component: ServerdownComponent},
  {path: 'deconnexion', component: DeconnexionComponent},
  {path: 'reinitialisationdemonmotdepasse/:id', component: ReinitialisationpasswordComponent},
  {path: 'créersoncompte', component: CreateaccountComponent},
  {path: 'gestion-des-donnees', component: PolitiquegestiondedonneesComponent},
  {path: 'contact', component: ContactComponent},
  {path: 'exercicederespiration', component: ExercicederespirationComponent},
  {path: 'mon_feed', component: InformationsComponent},
  {path: 'feed/:id', component: OneInfoComponent},
  {path: 'questionnaire', component: QuestionnaireComponent},
  {path: 'mes_infos_favorites', component: FavoriteInfoComponent},
  {path: 'mon_tableau_de_bord', component: DashboardComponent},
  {path: 'declarer_une_emotion', component: DeclarerUneEmotionComponent},
  {path: '**', component: AccueilComponent},
];
RouterModule.forRoot(routes, {useHash: true})
