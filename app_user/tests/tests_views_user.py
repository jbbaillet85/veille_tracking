from unittest import TestCase
import pytest

from django.urls import reverse, resolve
from django.test import Client
from pytest_django.asserts import assertTemplateUsed
from app_user.models import User
from app_user.views import RegisterUserView
from django.contrib.auth import get_user_model


class Test_User(TestCase):
    def setUp(self):
        self.user = User.objects.create(
            email="test@gmail.com", password="123456"
        )
        self.register = RegisterUserView()
        self.client = Client()

    @pytest.mark.django_db
    def test_user_register_view(self):
        path = reverse("register")
        response = self.client.post(
            path, kwargs={"email": "email@email.com", "password1": "password"}
        )

        self.assertEqual(self.register.get_success_url(), reverse("homepage"))
        self.assertEqual(response.status_code, 200)
        assertTemplateUsed(response, "app_user/register.html")
        self.assertEqual(resolve(path).view_name, "register")

    @pytest.mark.django_db
    def test_delete_user(self):
        self.user = get_user_model().objects.create_user(
            email="test@test.com", password="testpass"
        )
        self.client.login(email="test@test.com", password="testpass")
        path = reverse("delete_user")
        response = self.client.post(path)
        self.assertEqual(response.status_code, 302)
        self.assertFalse(get_user_model().objects.filter(
            id=self.user.id).exists())
