import pytest

from django.urls import reverse, resolve

@pytest.mark.django_db   
def test_homepage_url():
    path = reverse('homepage')
    assert path == "/"
    assert resolve(path).view_name == "homepage"