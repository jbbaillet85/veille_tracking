import pytest

from django.test import Client
from django.template.defaultfilters import slugify
from app_books.models import Book, Author, Category, Edition


@pytest.mark.django_db
def test_book_model():
    author = Author(name="Martin", lastname="Robert", contact="contact", slug="martin-robert")
    author.save()
    category = Category(name="Méthodes Agiles", slug="methodes-agiles")
    edition = Edition(name="Pearson", slug="pearson")
    edition.save()
    title = "Agile Proprement Retour à l'essentiel"
    slug = slugify(title)
    count_pages = 175
    current_page = 0
    ISBN = "9782326002869"
    more_infos = "https://www.pearson.fr/fr/book/?GCOI=27440100017670"
    couverture = "https://www.pearson.fr/resources/titles/27440100017670/images/27440100017670L.jpg"
    client = Client()
    book = Book.objects.create(
        title=title,
        slug=slug,
        count_pages=count_pages,
        current_page=current_page,
        ISBN=ISBN,
        more_infos=more_infos,
        couverture=couverture,
        author=author,
        category=category,
        edition=edition,
    )
    expected_value = slug
    assert str(book) == expected_value
