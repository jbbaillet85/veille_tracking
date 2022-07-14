import pytest

from django.test import Client
from django.template.defaultfilters import slugify
from app_books.models import Edition


@pytest.mark.django_db
def test_edition_model():
    name = "Pearson"
    slug = slugify(name)
    client = Client()
    edition = Edition.objects.create(name=name, slug=slug)
    expected_value = slug
    assert str(edition) == expected_value
