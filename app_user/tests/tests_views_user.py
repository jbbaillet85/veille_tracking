from unittest import TestCase
import pytest

from django.urls import reverse, resolve
from django.test import Client
from pytest_django.asserts import assertTemplateUsed
from app_user.models import User
from app_user.views import RegisterUserView


class Test_User(TestCase):
    def setUp(self):
        self.user = User.objects.create(
            email="test@gmail.com", password="123456")
        self.register = RegisterUserView()

    @pytest.mark.django_db
    def test_user_register_view(self):
        client = Client()
        path = reverse("register")
        response = client.post(
            path, kwargs={"email": "email@email.com", "password1": "password"}
        )

        self.assertEqual(self.register.get_success_url(), reverse("library"))
        self.assertEqual(response.status_code, 200)
        assertTemplateUsed(response, "app_user/register.html")
        self.assertEqual(resolve(path).view_name, "register")
