import pytest

from django.test import Client
from django.template.defaultfilters import slugify
from app_books.models import Author


@pytest.mark.django_db
def test_author_model():
    name = "Martin"
    lastname = "Robert"
    contact = "https://www.linkedin.com/in/robert-martin-7395b0/"
    slug = slugify(lastname + name)
    client = Client()
    author = Author.objects.create(
        name=name, lastname=lastname, contact=contact, slug=slug
    )
    expected_value = slug
    assert str(author) == expected_value
