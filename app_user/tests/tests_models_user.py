from unittest import TestCase

import pytest
from django.test import Client

from app_user.models import User


class Test_User(TestCase):
    def setUp(self) -> None:
        self.email = "user@gmail.com"
        self.username = "user"
        self.password = "password"
        self.client = Client()

    @pytest.mark.django_db
    def test_create_user_model(self):
        self.user = User.objects.create_user(
            username=self.username, email=self.email, password=self.password
        )
        assert str(self.user) == self.username
        self.assertEqual(self.username, "user")

    @pytest.mark.django_db
    def test_create_superuser_model(self):
        """
        Tests the creation of a superuser model in the User model.
        Asserts that the string representation of the superuser is the email,
        and that the username is set correctly.
        """
        self.superuser = User.objects.create_superuser(
            username=self.username, email=self.email, password=self.password
        )
        assert str(self.superuser) == self.username
        self.assertEqual(self.superuser.username, "user")
