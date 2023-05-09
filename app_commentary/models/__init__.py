from django.db import models
from django.db.models.constraints import UniqueConstraint
from django.core.validators import MaxValueValidator, MinValueValidator


from app_books.models import Book
from django.contrib.auth import get_user_model


class Commentary(models.Model):
    user = models.ForeignKey(get_user_model(), on_delete=models.CASCADE)
    book = models.ForeignKey(Book, on_delete=models.CASCADE)
    title = models.CharField(verbose_name='titre du commentaire',
                             max_length=255)
    notation = models.IntegerField(default=5,
                                   validators=[MinValueValidator(1),
                                               MaxValueValidator(5)])
    commentary = models.TextField(verbose_name='commentaire')

    class Meta:
        UniqueConstraint(fields=["user", "book"], name="commentary")

    def __str__(self) -> str:
        return f"{self.title} : {self.commentary}"
