from unittest import TestCase
import pytest

from django.template.defaultfilters import slugify
from app_books.models import Author


class Test_Author(TestCase):
    def setUp(self):
        name = "Martin"
        lastname = "Robert"
        contact = "https://www.linkedin.com/in/robert-martin-7395b0/"
        slug = slugify(name + "-" + lastname)
        self.author = Author.objects.create(
            name=name, lastname=lastname, contact=contact
        )
        self.expected_value = slug

    @pytest.mark.django_db
    def test_author_model(self):
        assert str(self.author) == self.expected_value
        assert self.author.slug == self.expected_value
