from django.template.defaultfilters import slugify
from django.db import models


class Edition(models.Model):
    """
    This model represents the Edition of a book.
    An Edition is defined by a name and a slug (for URL creation).

    Attributes:
    - name: a CharField with a max length of 255 and a unique constraint.
    Represents the name of the Edition.
    - slug: a SlugField with a max length of 255 and a unique constraint.
    Represents the URL-friendly version of the Edition name.
    Examples:
    >>> edition = Edition(name='Edition 1')
    >>> edition.name
    'Edition 1'
    >>> edition.slug
    'edition-1'
    >>> edition.save()
    >>> edition.slug
    'edition-1'
    """

    name = models.CharField(
        max_length=255, unique=True, verbose_name="Editeur", default=""
    )
    slug = models.SlugField(max_length=255, unique=True, blank=True)

    class Meta:
        verbose_name = "Editeur"

    def __str__(self):
        """
        The string representation of this model is the slug.
        """
        return slugify(self.name)

    def save(self, *args, **kwargs):
        """
        This custom save method generates the slug if it doesn't exist yet.
        """
        if not self.slug:
            self.slug = slugify(self.name)
        super().save(*args, **kwargs)


class Author(models.Model):
    """
    This model represents the Author of a book.
    An author is defined by its name, last name and contact (e.g. website).
    The author is also associated
    with a unique URL-friendly identifier: the slug.

    Attributes:
    - name: a CharField with a max length of 100.
    Represents the first name of the Author.
    - lastname: a CharField with a max length of 100.
    Represents the last name of the Author.
    - contact: a URLField representing the
    contact information of the Author (e.g. website).
    - slug: a SlugField with a max length of 255 and a unique constraint.
    Represents the URL-friendly version of the Author name.
    Example:
    >>> author = Author(
        name='John', lastname='Doe', contact='https://example.com')
    >>> author.save()
    >>> author.slug
    'john-doe'
    """

    name = models.CharField(max_length=100, verbose_name="Nom", default="")
    lastname = models.CharField(
        max_length=100, verbose_name="Prénom", default="")
    contact = models.URLField(verbose_name="Contact", default="", blank=True)
    slug = models.SlugField(
        max_length=255, default="", unique=True, blank=True)

    class Meta:
        verbose_name = "Auteur(e)"

    def __str__(self):
        """
        The string representation of this model is the slug.
        """
        return self.slug

    def save(self, *args, **kwargs):
        """
        This custom save method generates the slug if it doesn't exist yet.
        """
        if not self.slug:
            self.slug = slugify(self.name + "-" + self.lastname)
        super().save(*args, **kwargs)


class Book(models.Model):
    """
    A model representing a book with the following fields:

    title: CharField with a max length of
    255 characters and a verbose name of "Titre".
    It has a default value of an empty string.
    count_pages: IntegerField with a verbose name of "Nombre de pages".
    It has a default value of 0.
    current_page: IntegerField with a verbose name of "Page Courante".
    It has a default value of 0.
    ISBN: CharField with a max length of 13 characters
    and a default value of an empty string.
    more_infos: URLField with a verbose name of "Plus d'infos".
    It has a default value of an empty string.
    slug: SlugField with a max length of 255 characters,
    which must be unique and can be blank.
    It has a default value of an empty string.
    couverture: URLField with a verbose name of "Couverture".
    It has a default value of an empty string.
    author: ForeignKey to the Author model with a SET_NULL
    on delete behavior and it can be null and blank.
    edition: ForeignKey to the Edition model with a SET_NULL
    on delete behavior and it can be null and blank.
    """

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
        """
        The string representation of this model is the slug.
        """
        return self.slug

    def save(self, *args, **kwargs):
        """
        This custom save method generates the slug if it doesn't exist yet.
        """
        if not self.slug:
            self.slug = slugify(self.title)
        super().save(*args, **kwargs)


class Category(models.Model):
    """
    A model that represents a category of books.

    Attributes:
        name (models.CharField): The name of the category with
        a maximum length of 255 characters and unique.
        The default value is an empty string.
        slug (models.SlugField): A unique identifier for the category.
        The maximum length is 255 characters and it can be blank.
        category (models.ManyToManyField):
        A many-to-many relationship with the Book model.
    """

    name = models.CharField(
        max_length=255, unique=True, verbose_name="Catégorie", default=""
    )
    slug = models.SlugField(max_length=255, unique=True, blank=True)
    category = models.ManyToManyField(Book, verbose_name="Livre")

    class Meta:
        verbose_name = "Catégorie"

    def __str__(self):
        """
        The string representation of this model is the slug.
        """
        return slugify(self.name)

    def save(self, *args, **kwargs):
        """
        This custom save method generates the slug if it doesn't exist yet.
        Returns:
            None
        """
        if not self.slug:
            self.slug = slugify(self.name)
        super().save(*args, **kwargs)
