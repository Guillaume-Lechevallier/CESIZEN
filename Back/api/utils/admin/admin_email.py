import smtplib
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
from api.config.config import Config

def send_email(to_address, subject, html_body):
    msg = MIMEMultipart()
    msg['From'] = Config.EMAIL_CONFIG['from_address']
    msg['To'] = to_address
    msg['Subject'] = subject
    msg.attach(MIMEText(html_body, 'html'))

    with smtplib.SMTP(Config.EMAIL_CONFIG['smtp_server'], Config.EMAIL_CONFIG['smtp_port']) as server:
        server.starttls()
        server.login(Config.EMAIL_CONFIG['login'], Config.EMAIL_CONFIG['password'])
        server.sendmail(Config.EMAIL_CONFIG['from_address'], to_address, msg.as_string())

def admin_send_email_desactivation_compte(to_address, deletion_date):
    subject = "Votre compte sera supprimé dans 30 jours"
    html_body = f"""<!DOCTYPE html>
    <html lang="fr">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Confirmation de désactivation</title>
    </head>
    <body style="margin: 0; padding: 20px; background-color:#00177D; color: white; font-family: Arial, sans-serif;">
        <div style="background-color: white; color: black; padding: 20px; border-radius: 8px; max-width: 600px; margin: auto;">
            <h1 style="color: #00177D;">Votre compte a été désactivé</h1>
            <p>Bonjour,</p>
            <p>Votre compte a été désactivé avec succès. Il sera définitivement supprimé le <strong>{deletion_date}</strong>.</p>
            <p>Si vous souhaitez annuler cette action, vous pouvez juste vous reconnecter avec vos identifiants, il sera automatiquement</p>
            <p>Cordialement,<br>L'équipe de support</p>
        </div>
    </body>
    </html>"""
    send_email(to_address, subject, html_body)

def send_email_creation_compte(to_address, create_account_link):
    subject = "Vous avez été invité à rejoindre une équipe ! 🥳"
    html_body = f"""<!DOCTYPE html>
    <html lang="fr">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Vous avez-été invité à rejoindre une équipe !</title>
    </head>
    <body style="margin: 0; padding: 20px; background-color:#00177D; color: white; font-family: Arial, sans-serif;">
        <div style="background-color: white; color: black; padding: 20px; border-radius: 8px; max-width: 600px; margin: auto;">
            <h1 style="color: #00177D;">Votre compte a été Créé !</h1>
            <p>Bonjour,</p>
            <p>Votre compte a été créé ! Il ne vous reste plus qu'à l'activer ! .</p>
            <a href="{create_account_link}" 
                style="text-decoration: none; color: #ffffff; background-color: #00177D; padding: 10px 20px; border-radius: 5px; font-family: Arial, sans-serif; font-size: 16px; display: inline-block; transition: background-color 0.3s ease;" 
                onmouseout="this.style.backgroundColor='#00177D';">
                Créer mon compte !
            </a>
            <br>
            <p style="font-size: 24px; color: #333; font-family: Arial, sans-serif; margin: 0;">Si ce lien ne fonctionne pas, utilisez directement ce lien :</p>
            <p style="font-size: 16px; color: #00177D; font-family: Arial, sans-serif; margin: 0;">{create_account_link}</p>
            <p>Ce lien expirera dans 7 jours</p>
            <p>Cordialement,<br>L'équipe de support</p>
        </div>
    </body>
    </html>"""
    send_email(to_address, subject, html_body) 