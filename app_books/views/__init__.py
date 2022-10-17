from django.shortcuts import render
from app_books.search_books import SearchBooks


def search_book(request):
    search_book = request.GET.get("keyword")
    books = SearchBooks(search_book)
    context = {
        "object_list": books.search_books,
    }
    return render(request, "app_books/search_book.html", context)
