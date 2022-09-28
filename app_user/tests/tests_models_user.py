from django.test import Client
from unittest import TestCase
import pytest
from app_user.models import User


class Test_User(TestCase):
    def setUp(self) -> None:
        self.email = "user@gmail.com"
        self.password = "password"
        self.user = User.objects.create(
            email=self.email, password=self.password)
        self.client = Client()

    @pytest.mark.django_db
    def test_user_model(self):
        assert str(self.user) == self.email
