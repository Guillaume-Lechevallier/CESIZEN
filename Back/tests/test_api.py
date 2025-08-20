import unittest
import requests
import json
from datetime import datetime

class TestCESIZENAPI(unittest.TestCase):
    BASE_URL = "http://localhost:5000"  # Modifier si besoin
    test_token = None
    test_user_id = None

    def setUp(self):
        # Créer un utilisateur de test
        test_user_data = {
            "firstName": "Test",
            "lastName": "User",
            "email": f"test_{datetime.now().timestamp()}@test.com",
            "dob": "1990-01-01",
            "sex": "M",
            "password": "Test123!"
        }

        response = requests.post(f"{self.BASE_URL}/user/create_users", json=test_user_data)
        self.assertEqual(response.status_code, 201)

        # Authentifier et récupérer le token
        auth_response = requests.get(
            f"{self.BASE_URL}/auth/auth_by_password",
            headers={
                "email": test_user_data["email"],
                "password": test_user_data["password"]
            }
        )
        self.assertEqual(auth_response.status_code, 200)
        auth_data = auth_response.json()
        self.assertTrue(auth_data["auth"])
        self.test_token = auth_data["token"]

    def test_public_endpoints(self):
        response = requests.get(f"{self.BASE_URL}/")
        self.assertEqual(response.status_code, 200)
        self.assertEqual(response.text, "Bienvenu sur l'API de CESIZEN !")

        response = requests.get(f"{self.BASE_URL}/check_server")
        self.assertEqual(response.status_code, 200)
        self.assertEqual(response.json(), "True")

    def test_auth_token(self):
        response = requests.get(f"{self.BASE_URL}/auth/auth_by_token", headers={"token": self.test_token})
        self.assertEqual(response.status_code, 200)
        self.assertTrue(response.json())

    def test_user_data(self):
        response = requests.get(f"{self.BASE_URL}/get_user_data", headers={"token": self.test_token})
        self.assertEqual(response.status_code, 200)
        data = response.json()
        self.assertIn("nom", data)
        self.assertIn("prenom", data)
        self.assertIn("email", data)

    def test_get_dashboard_tracker(self):
        response = requests.get(f"{self.BASE_URL}/user/get_dashboard_tracker", headers={"token": self.test_token})
        self.assertEqual(response.status_code, 200)
        data = response.json()
        self.assertIn("emotions", data)
        self.assertIn("count", data)
        self.assertIn("emotion_list", data)

    def test_post_emotion(self):
        emotion_data = {"emotion": "happy", "sous_emotion": "joyful"}
        response = requests.post(f"{self.BASE_URL}/content/post_emotion", headers={"token": self.test_token}, json=emotion_data)
        self.assertEqual(response.status_code, 200)

    def test_get_content(self):
        resp = requests.get(f"{self.BASE_URL}/content/breathing-exercises")
        self.assertEqual(resp.status_code, 200)
        self.assertIsInstance(resp.json(), list)

        resp = requests.get(f"{self.BASE_URL}/content/get_questions", headers={"token": self.test_token})
        self.assertEqual(resp.status_code, 200)
        self.assertIsInstance(resp.json(), list)

        resp = requests.get(f"{self.BASE_URL}/content/get_emotion_list", headers={"token": self.test_token})
        self.assertEqual(resp.status_code, 200)
        self.assertIsInstance(resp.json(), list)

    def test_information_and_favorites(self):
        resp = requests.get(f"{self.BASE_URL}/content/information", headers={"token": self.test_token})
        self.assertEqual(resp.status_code, 200)
        info = resp.json()
        self.assertIn("id", info)

        info_id = info["id"]
        resp = requests.get(f"{self.BASE_URL}/content/one_information/{info_id}", headers={"token": self.test_token})
        self.assertEqual(resp.status_code, 200)

        resp = requests.post(f"{self.BASE_URL}/content/toggle_favorite/{info_id}", headers={"token": self.test_token})
        self.assertEqual(resp.status_code, 200)
        self.assertIn("is_favorite", resp.json())

        resp = requests.get(f"{self.BASE_URL}/content/favorite", headers={"token": self.test_token})
        self.assertEqual(resp.status_code, 200)
        self.assertIsInstance(resp.json(), list)

    def test_error_handling(self):
        resp = requests.get(f"{self.BASE_URL}/get_user_data")
        self.assertEqual(resp.status_code, 400)

        resp = requests.get(f"{self.BASE_URL}/get_user_data", headers={"token": "invalid_token"})
        self.assertEqual(resp.status_code, 404)

        resp = requests.get(f"{self.BASE_URL}/invalid_endpoint")
        self.assertEqual(resp.status_code, 404)

        resp = requests.post(f"{self.BASE_URL}/")
        self.assertEqual(resp.status_code, 405)

if __name__ == '__main__':
    unittest.main()