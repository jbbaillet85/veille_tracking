from django.contrib.auth.models import AbstractUser
from django.db import models


class User(AbstractUser):
    USERNAME_FIELD = 'email'
    email = models.EmailField(('email'), unique=True)
    REQUIRED_FIELDS = []

    def __str__(self) -> str:
        return f"{self.last_name}"
