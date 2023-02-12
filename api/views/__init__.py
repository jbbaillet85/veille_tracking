from rest_framework.views import APIView
from rest_framework.response import Response

from app_books.models import Category, Book, Edition, Author
from api.serializers import CategorySerializer, BookSerializer
from api.serializers import EditionSerializer, AuthorSerializer


class CategoryAPIView(APIView):

    def get(self, *args, **kwargs):
        categories = Category.objects.all()
        serializer = CategorySerializer(categories, many=True)
        return Response(serializer.data)


class BookAPIView(APIView):

    def get(self, *args, **kwargs):
        books = Book.objects.all()
        serializer = BookSerializer(books, many=True)
        return Response(serializer.data)


class EditionAPIView(APIView):

    def get(self, *args, **kwargs):
        edition = Edition.objects.all()
        serializer = EditionSerializer(edition, many=True)
        return Response(serializer.data)


class AuthorAPIView(APIView):

    def get(self, *args, **kwargs):
        author = Author.objects.all()
        serializer = AuthorSerializer(author, many=True)
        return Response(serializer.data)
