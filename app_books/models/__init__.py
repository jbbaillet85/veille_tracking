from django.template.defaultfilters import slugify
from django.db import models


# Create your models here.


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


class Author(models.Model):
    name = models.CharField(max_length=100, verbose_name="Nom", default="")
    lastname = models.CharField(
        max_length=100, verbose_name="Prénom", default="")
    contact = models.URLField(verbose_name="Contact", default="", blank=True)
    slug = models.SlugField(
        max_length=255, default="", unique=True, blank=True)

    class Meta:
        verbose_name = "Auteur(e)"

    def __str__(self):
        return self.slug

    def save(self, *args, **kwargs):
        if not self.slug:
            self.slug = slugify(self.name + "-" + self.lastname)
        super().save(*args, **kwargs)


class Book(models.Model):
    title = models.CharField(max_length=255, verbose_name="Titre", default="")
    count_pages = models.IntegerField(
        verbose_name="Nombre de pages", default=0)
    current_page = models.IntegerField(verbose_name="Page Courante", default=0)
    ISBN = models.CharField(max_length=13, default="")
    more_infos = models.URLField(verbose_name="Plus d'infos", default="")
    slug = models.SlugField(
        max_length=255, unique=True, blank=True, default="")
    couverture = models.URLField(verbose_name="Couverture", default="")
    author = models.ForeignKey(
        Author, on_delete=models.SET_NULL, null=True, blank=True)
    edition = models.ForeignKey(
        Edition, on_delete=models.SET_NULL, null=True, blank=True
    )

    class Meta:
        verbose_name = "Livre"

    def __str__(self):
        return self.slug

    def save(self, *args, **kwargs):
        if not self.slug:
            self.slug = slugify(self.title)
        super().save(*args, **kwargs)


class Category(models.Model):
    name = models.CharField(
        max_length=255, unique=True, verbose_name="Catégorie", default=""
    )
    slug = models.SlugField(max_length=255, unique=True, blank=True)
    category = models.ManyToManyField(Book, verbose_name="Livre")

    class Meta:
        verbose_name = "Catégorie"

    def __str__(self):
        return slugify(self.name)

    def save(self, *args, **kwargs):
        if not self.slug:
            self.slug = slugify(self.name)
        super().save(*args, **kwargs)
