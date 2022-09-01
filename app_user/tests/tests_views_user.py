import pytest

from django.urls import reverse
from django.test import Client
from pytest_django.asserts import assertTemplateUsed


@pytest.mark.django_db
def test_user_register_view():
    client = Client()
    path = reverse("register")
    response = client.get(path)
    assert response.status_code == 200
    assertTemplateUsed(response, "app_user/register.html")

    path = reverse("register")
    response = client.post(
        path, kwargs={"email": "email@email.com", "password1": "password"}
    )
    assert response.status_code == 200
    assertTemplateUsed(response, "app_user/register.html")
