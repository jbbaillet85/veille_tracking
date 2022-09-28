from django.db import models
from django.db.models.constraints import UniqueConstraint

from app_books.models import Book
from app_user.models import User


class Library(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    book = models.ForeignKey(Book, on_delete=models.CASCADE)
    current_page = models.IntegerField(default=0)

    class Meta:
        UniqueConstraint(fields=["user", "book"], name="library")

    def __str__(self) -> str:
        return f"{self.user} : {self.book}"
