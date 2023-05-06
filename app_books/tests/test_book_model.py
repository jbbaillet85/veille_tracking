from unittest import TestCase
from django.urls import reverse
import pytest

from django.template.defaultfilters import slugify
from app_books.models import Book, Author, Category, Edition


class Test_Book(TestCase):
    def setUp(self):
        self.author = Author(
            name="Martin",
            lastname="Robert",
            contact="contact",
            slug="martin-robert",
        )
        self.author.save()
        self.category = Category(
            name="Méthodes Agiles", slug="methodes-agiles"
        )
        self.edition = Edition(name="Pearson", slug="pearson")
        self.edition.save()
        title = "Agile Proprement Retour à l'essentiel"
        slug = slugify(title)
        count_pages = 175
        current_page = 0
        ISBN = "9782326002869"
        more_infos = "https://www.pearson.fr/fr/book/?GCOI=27440100017670"
        couverture = "https://www.pearson.fr/resources/titles/27440100017670/images/27440100017670L.jpg"  # noqa
        self.book = Book.objects.create(
            title=title,
            count_pages=count_pages,
            current_page=current_page,
            ISBN=ISBN,
            more_infos=more_infos,
            couverture=couverture,
            author=self.author,
            category=self.category,
            edition=self.edition,
        )
        self.expected_value = slug

    @pytest.mark.django_db
    def test_book_model(self):
        assert str(self.book) == self.expected_value
        assert self.book.slug == self.expected_value

    @pytest.mark.django_db
    def test_get_absolute_url(self):
        # Call the get_absolute_url method on the book object
        url = self.book.get_absolute_url()
        # Assert that the returned URL is the expected URL
        assert url == reverse('book-detail', args=[self.book.slug])
