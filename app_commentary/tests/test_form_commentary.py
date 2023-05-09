from django.test import TestCase
from django.contrib.auth import get_user_model

from app_books.models import Book
from app_commentary.views.form import CommentaryForm


class TestCommentaryForm(TestCase):
    def setUp(self):
        self.user = get_user_model().objects.create_user(
            email='testuser@test.com',
            password='testpass'
        )

        self.book = Book.objects.create(
            title='Test Book',
            ISBN='1234567890'
        )

    def test_commentary_form_valid(self):
        form_data = {
            'title': 'Test Title',
            'notation': 4,
            'commentary': 'This is a test commentary'
        }
        form = CommentaryForm(data=form_data)
        form.instance.user = self.user
        form.instance.book = self.book

        assert form.is_valid()

    def test_commentary_form_invalid(self):
        form_data = {
            'title': '',
            'notation': 6,
            'commentary': ''
        }
        form = CommentaryForm(data=form_data)
        form.instance.user = self.user
        form.instance.book = self.book

        assert not form.is_valid()
        assert 'title' in form.errors
        assert 'notation' in form.errors
        assert 'commentary' in form.errors
