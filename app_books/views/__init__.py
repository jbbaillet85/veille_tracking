from django.contrib import messages
from django.shortcuts import render
from django.views.generic import CreateView

from app_books.forms import BookForm
from app_books.models import Book
from app_books.search_books import SearchBooks


def search_book(request):
    """
    Handles the view for searching books by keyword.

    Arguments:
        request: An instance of `django.http.HttpRequest`
        representing the current request.

    Returns:
        A `django.http.HttpResponse` object that
        renders the `app_books/search_book.html` template,
        populated with the search results.
    """
    search_book = request.GET.get("keyword")
    books = SearchBooks(search_book)
    context = {
        "object_list": books.search_books,
    }
    return render(request, "app_books/search_book.html", context)


class BookCreateView(CreateView):
    """
    Provides a view for creating a new Book instance.
    The BookCreateView class is a Django CreateView that handles
    the creation of a new Book model instance.
    It uses the BookForm form class to handle the form submission and validation.
    When the form is valid, the submitted_by field is set to the current user,
    and the is_approved field is set to False.
    A success message is then displayed to the user.
    """

    model = Book
    template_name = "app_books/add_book.html"
    form_class = BookForm

    def form_valid(self, form):
        form.instance.submitted_by = self.request.user
        form.instance.is_approved = False
        messages.success(
            self.request,
            """Votre soumission a bien été prise en
            compte et sera validée par un administrateur""",
        )
        messages.success(self.request, "Merci de votre contribution.")
        messages.error(self.request, "Il y a une erreure dans le formulaire.")
        return super().form_valid(form)
