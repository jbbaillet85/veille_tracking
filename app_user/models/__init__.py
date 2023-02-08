from django.contrib.auth.models import AbstractUser
from django.contrib.auth.base_user import BaseUserManager
from django.db import models

class CustomUserManager(BaseUserManager):
    """
    Custom manager for User model.
    """

    def create_user(self, email, password, **kwargs):
        """
        Creates and saves a User with the given email and password.
        """
        if not email:
            raise ValueError("Email must be provided.")
        email = self.normalize_email(email)
        user = self.model(email=email, **kwargs)
        user.set_password(password)
        user.save()
        return user

    def create_superuser(self, email, password, **kwargs):
        """
        Creates and saves a superuser with the given email and password.
        """
        kwargs["is_staff"] = True
        kwargs["is_superuser"] = True
        kwargs["is_active"] = True
        return self.create_user(email=email, password=password, **kwargs)

class User(AbstractUser):
    """
    Custom User model, with email as the unique identifier instead of username.
    """
    username = None
    email = models.EmailField(("email"), unique=True)
    USERNAME_FIELD = "email"
    REQUIRED_FIELDS = []
    objects = CustomUserManager()

    def __str__(self) -> str:
        """
        Return the string representation of the User object.
        """
        return f"{self.email}"
