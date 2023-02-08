from django.db import models
from django.db.models.constraints import UniqueConstraint

from app_books.models import Book
from app_user.models import User


class Library(models.Model):
    """Class representing a library.
    A library is a collection of books associated with a user. The library has a
    current page, which specifies the last page the user read for each book.

    Attributes:
    user (ForeignKey): ForeignKey to User model.
    book (ForeignKey): ForeignKey to Book model.
    current_page (int): Current page for the book.

    Meta:
    UniqueConstraint: Constrains library to have unique user and book
    combination.

    """
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    book = models.ForeignKey(Book, on_delete=models.CASCADE)
    current_page = models.IntegerField(default=0)

    class Meta:
        UniqueConstraint(fields=["user", "book"], name="library")

    def __str__(self) -> str:
        return f"{self.user} : {self.book}"
