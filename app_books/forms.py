from app_books.models import Book
from django import forms


class BookForm(forms.ModelForm):

    class Meta:
        model = Book
        fields = [
            'title',
            'count_pages',
            'ISBN',
            'more_infos',
            'couverture',
            'author',
            'edition'
        ]
        help_texts = {
            'title': 'Le titre du livre',
            'count_pages': 'Le nombre de pages du livre',
            'ISBN': 'Le numéro ISBN du livre',
            'more_infos': 'Un lien vers les informations du livre',
            'couverture': 'Un lien vers la couverture du livre',
            'author': 'L\'auteur du livre',
            'category': 'La catégorie du livre',
            'edition': 'L\'édition du livre'
        }
