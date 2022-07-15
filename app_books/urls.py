from django.urls import path
from django.views.generic import DetailView
from .models import Book

urlpatterns = [
    path(
        "<slug:slug>/",
        DetailView.as_view(template_name="app_books/detail_book.html", model=Book),
        name="book-detail",
    ),
]
