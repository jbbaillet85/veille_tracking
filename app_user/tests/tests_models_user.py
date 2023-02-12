from django.test import Client
from unittest import TestCase
import pytest
from app_user.models import User


class Test_User(TestCase):
    def setUp(self) -> None:
        self.email = "user@gmail.com"
        self.password = "password"
        self.client = Client()

    @pytest.mark.django_db
    def test_create_user_model(self):
        self.user = User.objects.create_user(
            email=self.email, password=self.password
        )
        assert str(self.user) == self.email
        self.assertEqual(self.user.email, "user@gmail.com")

    @pytest.mark.django_db
    def test_create_superuser_model(self):
        self.superuser = User.objects.create_superuser(
            email=self.email, password=self.password
        )
        assert str(self.superuser) == self.email
        self.assertEqual(self.superuser.email, "user@gmail.com")

    @pytest.mark.django_db
    def test_create_user_if_not_email(self):
        pass
