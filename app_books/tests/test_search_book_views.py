from unittest import TestCase
import pytest

from django.urls import reverse, resolve
from django.test import Client
from pytest_django.asserts import assertTemplateUsed
from app_user.models import User
from app_user.views import RegisterUserView


class Test_Book(TestCase):
    def setUp(self):
        self.user = User.objects.create(
            email="test@gmail.com", password="123456")
        self.register = RegisterUserView()

    @pytest.mark.django_db
    def test_search_book_view(self):
        client = Client()
        path = reverse("search_book")
        response = client.get(
            path, kwargs={"keyword": "web"}
        )
        self.assertEqual(response.status_code, 200)
        assertTemplateUsed(response, "app_books/search_book.html")
        self.assertEqual(resolve(path).view_name, "search_book")
