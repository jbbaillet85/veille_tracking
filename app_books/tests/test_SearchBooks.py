from app_books.search_books import SearchBooks
from unittest import TestCase
import pytest


class Test_Book(TestCase):
    def setUp(self):
        self.keyword = "web"
        self.search_book = SearchBooks(self.keyword)
        self.expected_value = f"keyword: {self.keyword}"

    @pytest.mark.django_db
    def test_book_model(self):
        assert str(self.search_book) == self.expected_value
