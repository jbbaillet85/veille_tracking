from django.test import TestCase
from django.contrib.auth import get_user_model
from app_books.models import Book
from app_commentary.models import Commentary


class TestCommentaryModel(TestCase):
    def setUp(self):
        self.user = get_user_model().objects.create_user(
            email='testuser@test.com',
            password='testpass'
        )
        self.book = Book.objects.create(
            title='Test Book',
            ISBN='1234567890'
        )
        self.commentary = Commentary.objects.create(
            user=self.user,
            book=self.book,
            title='super livre',
            notation=3,
            commentary='je recommande'
        )

    def test_commentary_model(self):
        self.assertEqual(str(self.commentary), 'super livre : je recommande')
        self.assertEqual(self.commentary.notation, 3)
        self.assertEqual(self.commentary.user, self.user)
        self.assertEqual(self.commentary.book, self.book)
