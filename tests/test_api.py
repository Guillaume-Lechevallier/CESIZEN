import unittest
import requests
import json
from datetime import datetime

class TestCESIZENAPI(unittest.TestCase):
    BASE_URL = "http://localhost:5000"  # Change this if your API runs on a different URL
    test_token = None
    test_user_id = None

    def setUp(self):
        """Set up test data and authentication"""
        # Create a test user for authenticated endpoints
        test_user_data = {
            "firstName": "Test",
            "lastName": "User",
            "email": f"test_{datetime.now().timestamp()}@test.com",
            "dob": "1990-01-01",
            "sex": "M",
            "password": "Test123!"
        }
        
        response = requests.post(
            f"{self.BASE_URL}/user/create_users",
            json=test_user_data
        )
        if response.status_code != 201:
            print(f"Error creating test user: {response.text}")
        self.assertEqual(response.status_code, 201)
        
        # Login to get token
        auth_response = requests.get(
            f"{self.BASE_URL}/auth/auth_by_password",
            headers={
                "email": test_user_data["email"],
                "password": test_user_data["password"]
            }
        )
        if auth_response.status_code != 200:
            print(f"Error authenticating test user: {auth_response.text}")
        self.assertEqual(auth_response.status_code, 200)
        auth_data = auth_response.json()
        self.assertTrue(auth_data["auth"])
        self.test_token = auth_data["token"]

    def test_01_public_endpoints(self):
        """Test public endpoints that don't require authentication"""
        
        # Test hello endpoint
        response = requests.get(f"{self.BASE_URL}/")
        self.assertEqual(response.status_code, 200)
        self.assertEqual(response.text, "Bienvenu sur l'API de CESIZEN !")
        
        # Test check_server endpoint
        response = requests.get(f"{self.BASE_URL}/check_server")
        self.assertEqual(response.status_code, 200)
        self.assertEqual(response.json(), "True")

    def test_02_auth_endpoints(self):
        """Test authentication endpoints"""
        
        # Test auth_by_token with valid token
        response = requests.get(
            f"{self.BASE_URL}/auth/auth_by_token",
            headers={"token": self.test_token}
        )
        self.assertEqual(response.status_code, 200)
        self.assertTrue(response.json())
        
        # Test auth_by_token with invalid token
        response = requests.get(
            f"{self.BASE_URL}/auth/auth_by_token",
            headers={"token": "invalid_token"}
        )
        self.assertEqual(response.status_code, 200)
        self.assertFalse(response.json())
        
        # Test auth_by_password with invalid credentials
        response = requests.get(
            f"{self.BASE_URL}/auth/auth_by_password",
            headers={
                "email": "invalid@test.com",
                "password": "wrongpassword"
            }
        )
        self.assertEqual(response.status_code, 200)
        self.assertFalse(response.json()["auth"])

    def test_03_user_endpoints(self):
        """Test user-related endpoints"""
        
        # Test get_user_data
        response = requests.get(
            f"{self.BASE_URL}/get_user_data",
            headers={"token": self.test_token}
        )
        if response.status_code != 200:
            print(f"Error in get_user_data: {response.text}")
        self.assertEqual(response.status_code, 200)
        user_data = response.json()
        self.assertIn("nom", user_data)
        self.assertIn("prenom", user_data)
        self.assertIn("email", user_data)
        
        # Test get_dashboard_tracker
        response = requests.get(
            f"{self.BASE_URL}/user/get_dashboard_tracker",
            headers={"token": self.test_token}
        )
        if response.status_code != 200:
            print(f"Error in get_dashboard_tracker: {response.text}")
        self.assertEqual(response.status_code, 200)
        dashboard_data = response.json()
        self.assertIn("emotions", dashboard_data)
        self.assertIn("count", dashboard_data)
        self.assertIn("emotion_list", dashboard_data)

    def test_04_content_endpoints(self):
        """Test content-related endpoints"""
        
        # Test get_breathing_exercises
        response = requests.get(f"{self.BASE_URL}/content/breathing-exercises")
        if response.status_code != 200:
            print(f"Error in get_breathing_exercises: {response.text}")
        self.assertEqual(response.status_code, 200)
        exercises = response.json()
        self.assertIsInstance(exercises, list)
        
        # Test get_questions
        response = requests.get(
            f"{self.BASE_URL}/content/get_questions",
            headers={"token": self.test_token}
        )
        if response.status_code != 200:
            print(f"Error in get_questions: {response.text}")
        self.assertEqual(response.status_code, 200)
        questions = response.json()
        self.assertIsInstance(questions, list)
        
        # Test get_emotion_list
        response = requests.get(
            f"{self.BASE_URL}/content/get_emotion_list",
            headers={"token": self.test_token}
        )
        if response.status_code != 200:
            print(f"Error in get_emotion_list: {response.text}")
        self.assertEqual(response.status_code, 200)
        emotions = response.json()
        self.assertIsInstance(emotions, list)
        
        # Test post_emotion
        emotion_data = {
            "emotion": "happy",
            "sous_emotion": "joyful"
        }
        response = requests.post(
            f"{self.BASE_URL}/content/post_emotion",
            headers={"token": self.test_token},
            json=emotion_data
        )
        if response.status_code != 200:
            print(f"Error in post_emotion: {response.text}")
        self.assertEqual(response.status_code, 200)
        
        # Test get_information
        response = requests.get(
            f"{self.BASE_URL}/content/information",
            headers={"token": self.test_token}
        )
        if response.status_code != 200:
            print(f"Error in get_information: {response.text}")
        self.assertEqual(response.status_code, 200)
        info = response.json()
        self.assertIn("id", info)
        self.assertIn("content", info)
        
        # Test get_one_information
        if info and "id" in info:
            response = requests.get(
                f"{self.BASE_URL}/content/one_information/{info['id']}",
                headers={"token": self.test_token}
            )
            if response.status_code != 200:
                print(f"Error in get_one_information: {response.text}")
            self.assertEqual(response.status_code, 200)
            one_info = response.json()
            self.assertIn("id", one_info)
            self.assertIn("content", one_info)
            
            # Test toggle_favorite
            response = requests.post(
                f"{self.BASE_URL}/content/toggle_favorite/{info['id']}",
                headers={"token": self.test_token}
            )
            if response.status_code != 200:
                print(f"Error in toggle_favorite: {response.text}")
            self.assertEqual(response.status_code, 200)
            favorite_data = response.json()
            self.assertIn("is_favorite", favorite_data)
            
            # Test get_all_favorite_info
            response = requests.get(
                f"{self.BASE_URL}/content/favorite",
                headers={"token": self.test_token}
            )
            if response.status_code != 200:
                print(f"Error in get_all_favorite_info: {response.text}")
            self.assertEqual(response.status_code, 200)
            favorites = response.json()
            self.assertIsInstance(favorites, list)

    def test_05_error_handling(self):
        """Test error handling for various scenarios"""
        
        # Test missing token
        response = requests.get(f"{self.BASE_URL}/get_user_data")
        self.assertEqual(response.status_code, 400)
        self.assertIn("error", response.json())
        
        # Test invalid token
        response = requests.get(
            f"{self.BASE_URL}/get_user_data",
            headers={"token": "invalid_token"}
        )
        self.assertEqual(response.status_code, 404)
        self.assertIn("error", response.json())
        
        # Test invalid endpoint
        response = requests.get(f"{self.BASE_URL}/invalid_endpoint")
        self.assertEqual(response.status_code, 404)
        
        # Test invalid method
        response = requests.post(f"{self.BASE_URL}/")
        self.assertEqual(response.status_code, 405)

if __name__ == '__main__':
    unittest.main() 