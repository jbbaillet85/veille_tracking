import pytest

from django.test import Client
from django.template.defaultfilters import slugify
from app_books.models import Book, Author


# @pytest.mark.django_db
# def test_author_model():
#     name = "Martin"
#     lastname = "Robert"
#     contact = "https://www.linkedin.com/in/robert-martin-7395b0/"
#     slug = slugify(lastname + name)
#     client = Client()
#     category = Category.objects.create(name=name, lastname=lastname, contact=contact, slug=slug)
#     expected_value = slug
#     assert str(category) == expected_value


# @pytest.mark.django_db
# def test_book_model():
#     name = "Agile Proprement Retour à l'essentiel"
#     slug = slugify(name)
#     count_pages = 175
#     current_page = 0
#     ISBN = "9782326002869"
#     more_infos = "https://www.pearson.fr/fr/book/?GCOI=27440100017670"
#     couverture = "https://www.pearson.fr/resources/titles/27440100017670/images/27440100017670L.jpg"
#     authore = Author(name="Martin", lastname="Robert", contact="contact", slug="martin-robert")
#     category = Category(name="Méthodes Agiles", slug="methodes-agiles")
#     edition = Edition(name="Pearson", slug="pearson")
#     client = Client()
#     book = Book.objects.create(
#         name=name,
#         slug=slug,
#         count_pages=count_pages,
#         current_page=current_page,
#         ISBN=ISBN,
#         more_infos=more_infos,
#         couverture=couverture,
#         authore=authore,
#         category=category,
#         edition=edition,
#     )
#     expected_value = slug
#     assert str(book) == expected_value
