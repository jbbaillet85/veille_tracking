import pytest

from django.test import Client
from app_user.models import User


@pytest.mark.django_db
def test_user_model():
    username = "user@gmail.com"
    email = "user@gmail.com"
    password="password"
    client = Client()
    user = User.objects.create(username=username, email=email, password=password)
    expected_value = email
    assert str(user) == expected_value
