from django.shortcuts import render
from django.views.generic import CreateView
from app_books.search_books import SearchBooks
from app_books.models import Book
from app_books.forms import BookForm


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
    model = Book
    template_name = "app_books/add_book.html"
    form_class = BookForm
