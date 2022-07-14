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
    name = models.CharField(max_length=255, unique=True, verbose_name="Editeur", default="")
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
    pass

    class Meta:
        pass

    def __str__(self):
        pass


class Author(models.Model):
    pass

    class Meta:
        pass

    def __str__(self):
        pass
