from unittest import TestCase
import pytest

from app_library.models import Library
from app_user.models import User
from app_books.models import Book, Author, Edition, Category
from django.template.defaultfilters import slugify


class Test_Library(TestCase):
    def setUp(self):
        self.email = "user@gmail.com"
        self.password = "password"
        self.user = User.objects.create(
            email=self.email, password=self.password
        )
        self.author = Author(
            name="Martin",
            lastname="Robert",
            contact="contact",
            slug="martin-robert",
        )
        self.author.save()
        category = Category(name="Méthodes Agiles", slug="methodes-agiles")
        edition = Edition(name="Pearson", slug="pearson")
        edition.save()
        title = "Agile Proprement Retour à l'essentiel"
        slug = slugify(title)
        count_pages = 175
        current_page = 0
        ISBN = "9782326002869"
        more_infos = "https://www.pearson.fr/fr/book/?GCOI=27440100017670"
        couverture = "https://www.pearson.fr/resources/titles/27440100017670/images/27440100017670L.jpg"  # noqa
        self.book = Book.objects.create(
            title=title,
            slug=slug,
            count_pages=count_pages,
            current_page=current_page,
            ISBN=ISBN,
            more_infos=more_infos,
            couverture=couverture,
            author=self.author,
            category=category,
            edition=edition,
        )
        self.library = Library.objects.create(user=self.user, book=self.book)

    @pytest.mark.django_db
    def test_Library_model(self):
        expected_value = f"{self.user} : {self.book}"
        self.assertEqual(str(self.library), expected_value)
