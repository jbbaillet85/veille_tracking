import pytest

from django.test import Client
from django.template.defaultfilters import slugify
from app_books.models import Category


@pytest.mark.django_db
def test_category_model():
    name = "Méthodes Agiles"
    slug = slugify(name)
    client = Client()
    category = Category.objects.create(name=name, slug=slug)
    expected_value = slug
    assert str(category) == expected_value
