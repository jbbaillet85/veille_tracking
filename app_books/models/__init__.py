from operator import mod
from tabnanny import verbose
from django.template.defaultfilters import slugify
from django.db import models


# Create your models here.
class Book(models.Model):
    pass

    class Meta:
        pass

    def __str__(self):
        pass


class Edition(models.Model):
    name = models.CharField(
        max_length=255, unique=True, verbose_name="Editeur", default=""
    )
    slug = models.SlugField(max_length=255, unique=True, blank=True)

    class Meta:
        verbose_name = "Editeur"

    def __str__(self):
        return slugify(self.name)

    def save(self, *args, **kwargs):
        if not self.slug:
            self.slug = slugify(self.name)
        super().save(*args, **kwargs)


class Category(models.Model):
    name = models.CharField(
        max_length=255, unique=True, verbose_name="Catégorie", default=""
    )
    slug = models.SlugField(max_length=255, unique=True, blank=True)

    class Meta:
        verbose_name = "Catégorie"

    def __str__(self):
        return slugify(self.name)

    def save(self, *args, **kwargs):
        if not self.slug:
            self.slug = slugify(self.name)
        super().save(*args, **kwargs)


class Author(models.Model):
    name = models.CharField(max_length=100, verbose_name="Nom", default="")
    lastname = models.CharField(max_length=100, verbose_name="Prénom", default="")
    contact = models.URLField(verbose_name="Contact", unique=True, default="")
    slug = models.SlugField(max_length=255,default="")

    class Meta:
        verbose_name = "Auteur(e)"

    def __str__(self):
        return self.slug

    def save(self, *args, **kwargs):
        if not self.slug:
            self.slug = slugify(self.name + self.lastname)
        super().save(*args, **kwargs)
