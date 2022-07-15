import pytest
from django.test import Client
from django.urls import reverse, resolve
from pytest_django.asserts import assertTemplateUsed


@pytest.mark.django_db
def test_homepage_url():
    client = Client()
    path = reverse("homepage")
    response = client.get(path)
    assert path == "/"
    assert resolve(path).view_name == "homepage"
    assert response.status_code == 200
    assertTemplateUsed(response, "homepage/homepage.html")
