from rest_framework.viewsets import ReadOnlyModelViewSet

from app_books.models import Category, Book, Edition, Author
from api.serializers import CategorySerializer, BookSerializer
from api.serializers import EditionSerializer, AuthorSerializer


class CategoryViewset(ReadOnlyModelViewSet):

    serializer_class = CategorySerializer

    def get_queryset(self):
        return Category.objects.all()


class BookViewset(ReadOnlyModelViewSet):

    serializer_class = BookSerializer

    def get_queryset(self):
        return Book.objects.all()


class EditionViewset(ReadOnlyModelViewSet):

    serializer_class = EditionSerializer

    def get_queryset(self):
        return Edition.objects.all()


class AuthorViewset(ReadOnlyModelViewSet):
    serializer_class = AuthorSerializer

    def get_queryset(self):
        return Author.objects.all()
