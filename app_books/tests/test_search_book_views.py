from unittest import TestCase
import pytest
from django.urls import reverse, resolve
from django.test import Client
from pytest_django.asserts import assertTemplateUsed


class Test_Book(TestCase):
    def setUp(self):
        self.client = Client()
        self.path = reverse("search_book")
        self.response = self.client.get(self.path, kwargs={"keyword": "web"})

    @pytest.mark.django_db
    def test_search_book_view(self):
        self.assertEqual(self.response.status_code, 200)
        assertTemplateUsed(self.response, "app_books/search_book.html")
        self.assertEqual(resolve(self.path).view_name, "search_book")
