from rest_framework.serializers import ModelSerializer
from app_books.models import Book, Category, Edition, Author


class BookSerializer(ModelSerializer):

    class Meta:
        model = Book
        fields = [
            'id', 'title', 'count_pages', 'current_page', 'ISBN',
            'more_infos', 'slug', 'couverture', 'author', 'edition']


class CategorySerializer(ModelSerializer):
    class Meta:
        model = Category
        fields = ['id', 'name', 'slug', 'category']


class EditionSerializer(ModelSerializer):

    class Meta:
        model = Edition
        fields = ['id', 'name', 'slug']


class AuthorSerializer(ModelSerializer):

    class Meta:
        model = Author
        fields = ['id', 'name', 'lastname', 'slug']
