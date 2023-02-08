from django.shortcuts import render
from app_books.search_books import SearchBooks


def search_book(request):
    """
    Handles the view for searching books by keyword.
    
    Arguments:
        request: An instance of `django.http.HttpRequest` representing the current request.

    Returns:
        A `django.http.HttpResponse` object that renders the `app_books/search_book.html` template, 
        populated with the search results.
    """
    search_book = request.GET.get("keyword")
    books = SearchBooks(search_book)
    context = {
        "object_list": books.search_books,
    }
    return render(request, "app_books/search_book.html", context)
