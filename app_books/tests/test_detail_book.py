from unittest import TestCase
import pytest

from django.urls import reverse, resolve
from django.template.defaultfilters import slugify
from django.test import Client
from pytest_django.asserts import assertTemplateUsed
from app_books.models import Author, Category, Edition, Book


class Test_Book(TestCase):
    def setUp(self):
        self.author = Author(
            name="Martin", lastname="Robert",
            contact="contact", slug="martin-robert"
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

    @pytest.mark.django_db
    def test_detail_book_url_view(self):
        client = Client()
        path = reverse("book-detail", kwargs={"slug": self.book.slug})
        response = client.get(path)
        assert path == f"/book/{self.book.slug}/"
        assert resolve(path).view_name == "book-detail"
        assert response.status_code == 200
        assertTemplateUsed(response, "app_books/detail_book.html")
