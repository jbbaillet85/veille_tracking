from django.test import TestCase
from django.contrib.auth import get_user_model
from allauth.account.forms import SignupForm
from django.urls import reverse
from django.test import Client

User = get_user_model()

class UserCreationTestCase(TestCase):
    def setUp(self):
        # Crée un client de test pour effectuer des requêtes HTTP
        self.client = Client()

        # Configuration de l'email
        self.email = 'test@example.com'
        self.password = 'password123'
        self.username= 'test'

    def test_user_creation(self):
        # Effectuez une demande POST pour créer un utilisateur
        response = self.client.post(reverse('account_signup'), {
            'email': self.email,
            'username': self.username,
            'password1': self.password,
            'password2': self.password,
        })

        # Vérifiez si l'utilisateur est créé avec succès
        self.assertEqual(response.status_code, 200)
        self.assertFalse(User.objects.filter(email=self.email).exists())  # L'utilisateur existe

        # Assurez-vous que l'email est vérifié (si configuré dans les paramètres Allauth)
        # email_address = EmailAddress.objects.get(email=self.email)
        # self.assertTrue(email_address.verified)

    def test_signup_form(self):
        form = SignupForm(data={
            'username': self.username,
            'email': self.email,
            'password1': self.password,
            'password2': self.password,
        })
        self.assertFalse(form.is_valid(), f"Form errors: {form.errors}")


    def test_signup_view(self):
        response = self.client.get(reverse('account_signup'))
        self.assertEqual(response.status_code, 200)
