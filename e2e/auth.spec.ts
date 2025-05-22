import { test, expect } from '@playwright/test';

test.describe('Authentication Flow', () => {
  test.beforeEach(async ({ page }) => {
    // Naviguer vers la page de connexion avant chaque test
    await page.goto('/login');
    // Nettoyer le localStorage avant chaque test
    await page.evaluate(() => localStorage.clear());
  });

  test('should display login form', async ({ page }) => {
    // Vérifier que le formulaire de connexion est présent
    await expect(page.getByText('Connectez-vous à votre compte')).toBeVisible();
    await expect(page.getByPlaceholder('Votre Email')).toBeVisible();
    await expect(page.getByPlaceholder('Votre Mot de passe')).toBeVisible();
    await expect(page.getByRole('button', { name: 'Connexion' })).toBeVisible();
    await expect(page.getByText('Pas de compte ?')).toBeVisible();
    await expect(page.getByRole('link', { name: 'Créez votre compte !' })).toBeVisible();
  });

  test('should show error with invalid credentials', async ({ page }) => {
    // Remplir le formulaire avec des identifiants invalides
    await page.getByPlaceholder('Votre Email').fill('invalid@email.com');
    await page.getByPlaceholder('Votre Mot de passe').fill('wrongpassword');
    await page.getByRole('button', { name: 'Connexion' }).click();

    // Vérifier le message d'erreur
    await expect(page.getByText('Identifiant ou mot de passe incorrect')).toBeVisible();
  });

  test('should successfully login with valid credentials', async ({ page }) => {
    // Remplir le formulaire avec des identifiants valides
    await page.getByPlaceholder('Votre Email').fill('moilechevallier@gmail.com');
    await page.getByPlaceholder('Votre Mot de passe').fill('Watsoftjui2023..');
    await page.getByRole('button', { name: 'Connexion' }).click();

    // Vérifier la redirection vers la page d'accueil
    await expect(page).toHaveURL('/accueil');
    
    // Vérifier que le token est stocké dans le localStorage
    const token = await page.evaluate(() => localStorage.getItem('token'));
    expect(token).toBeTruthy();
  });

  test('should handle session expiration', async ({ page }) => {
    // Simuler un token expiré
    await page.evaluate(() => {
      localStorage.setItem('token', 'expired_token');
    });

    // Naviguer vers la page de connexion
    await page.goto('/login');

    // Vérifier le message d'expiration de session
    await expect(page.getByText('Session expirée, veuillez vous reconnecter')).toBeVisible();
  });

  test('should redirect to login when accessing protected route', async ({ page }) => {
    // Essayer d'accéder directement à une route protégée
    await page.goto('/mon_tableau_de_bord');

    // Vérifier la redirection vers la page de connexion
    await expect(page).toHaveURL('/login');
  });

  test('should maintain session after page reload', async ({ page }) => {
    // Se connecter
    await page.getByPlaceholder('Votre Email').fill('moilechevallier@gmail.com');
    await page.getByPlaceholder('Votre Mot de passe').fill('Watsoftjui2023..');
    await page.getByRole('button', { name: 'Connexion' }).click();

    // Attendre la redirection
    await expect(page).toHaveURL('/accueil');

    // Recharger la page
    await page.reload();

    // Vérifier que nous sommes toujours sur la page d'accueil
    await expect(page).toHaveURL('/accueil');
    
    // Vérifier que le token est toujours présent
    const token = await page.evaluate(() => localStorage.getItem('token'));
    expect(token).toBeTruthy();
  });

  test('should handle server down scenario', async ({ page }) => {
    // Simuler un serveur down en interceptant la requête d'authentification
    await page.route('**/auth/auth_by_password', route => 
      route.fulfill({ status: 500, body: 'Server Error' })
    );

    // Tenter de se connecter
    await page.getByPlaceholder('Votre Email').fill('moilechevallier@gmail.com');
    await page.getByPlaceholder('Votre Mot de passe').fill('Watsoftjui2023..');
    await page.getByRole('button', { name: 'Connexion' }).click();

    // Vérifier la redirection vers la page serveur down
    await expect(page).toHaveURL('/serveur_is_down');
  });

  test('should handle enter key for login', async ({ page }) => {
    // Remplir le formulaire
    await page.getByPlaceholder('Votre Email').fill('moilechevallier@gmail.com');
    await page.getByPlaceholder('Votre Mot de passe').fill('Watsoftjui2023..');
    
    // Appuyer sur Entrée dans le champ mot de passe
    await page.getByPlaceholder('Votre Mot de passe').press('Enter');

    // Vérifier la redirection vers la page d'accueil
    await expect(page).toHaveURL('/accueil');
  });

  test('should navigate to create account page', async ({ page }) => {
    // Cliquer sur le lien de création de compte
    await page.getByRole('link', { name: 'Créez votre compte !' }).click();

    // Vérifier la redirection vers la page de création de compte
    await expect(page).toHaveURL('/créersoncompte');
  });
}); 