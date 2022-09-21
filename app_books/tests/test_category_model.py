from unittest import TestCase
import pytest

from django.test import Client
from django.template.defaultfilters import slugify
from app_books.models import Category


class Test_Category(TestCase):
    def setUp(self):
        self.name = "Méthodes Agiles"
        self.slug = slugify(self.name)
        client = Client()
        self.category = Category.objects.create(name=self.name)
        self.expected_value = self.slug

    @pytest.mark.django_db
    def test_category_model(self):
        assert str(self.category) == self.expected_value
        assert self.category.slug == slugify(self.name)
