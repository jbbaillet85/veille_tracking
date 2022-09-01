import pytest
from app_user.models import User


@pytest.mark.django_db
def test_user_model():
    email = "user@gmail.com"
    password = "password"
    user = User.objects.create(email=email, password=password)
    expected_value = email
    assert str(user) == expected_value
