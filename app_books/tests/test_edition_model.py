from unittest import TestCase
import pytest

from django.test import Client
from django.template.defaultfilters import slugify
from app_books.models import Edition

class Test_Edition(TestCase):
    def setUp(self):
        self.name = "Pearson"
        self.slug = slugify(self.name)
        client = Client()
        self.edition = Edition.objects.create(name=self.name)
        self.expected_value = self.slug


    @pytest.mark.django_db
    def test_edition_model(self):
        assert str(self.edition) == self.expected_value
        assert self.edition.slug == slugify(self.name)
