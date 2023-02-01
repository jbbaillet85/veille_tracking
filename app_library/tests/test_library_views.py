from app_user.models import User
from django.test import RequestFactory, TestCase
from app_books.models import Book, Author, Edition, Category
from app_library.models import Library
from app_library.views import createLibrary, saveCurrentPage, CreateLibraryView
from django.template.defaultfilters import slugify
from django.urls import reverse


class LibraryViewTests(TestCase):
    def setUp(self):
        self.factory = RequestFactory()
        self.email = "user@gmail.com"
        self.password = "password"
        self.user = User.objects.create(email=self.email, password=self.password)
        self.author = Author(
            name="Martin", lastname="Robert", contact="contact", slug="martin-robert"
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
        self.book_slug = slugify("Agile Proprement Retour à l'essentiel")

    def test_create_library_view(self):
        path = reverse("createLibrary")
        request = self.factory.get(path)
        request.user = self.user
        response = CreateLibraryView.as_view()(request)
        self.assertEqual(response.status_code, 200)

    def test_create_library_function(self):
        path = reverse("createLibrary")
        request = self.factory.post(path, {"book_slug": self.book_slug})
        request.user = self.user
        response = createLibrary(request)
        self.assertEqual(response.status_code, 302)
        self.assertEqual(Library.objects.count(), 1)
        self.assertEqual(Library.objects.get().book, self.book)
        self.assertEqual(Library.objects.get().user, self.user)

    def test_save_current_page_function(self):
        path = reverse("saveCurrentPage")
        Library.objects.create(book=self.book, user=self.user, current_page=0)
        request = self.factory.post(
            path, {"book_slug": self.book_slug, "current_page": 10}
        )
        request.user = self.user
        response = saveCurrentPage(request)
        self.assertEqual(response.status_code, 302)
        self.assertEqual(Library.objects.count(), 1)
        self.assertEqual(Library.objects.get().current_page, 10)
