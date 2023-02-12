from django.urls import path, include
from api.views.modelViewsets import BookViewset, CategoryViewset
from api.views.modelViewsets import EditionViewset, AuthorViewset

from rest_framework import routers

router = routers.SimpleRouter()

router.register('category', CategoryViewset, basename='category')
router.register('book', BookViewset, basename='book')
router.register('edition', EditionViewset, basename='edition')
router.register('author', AuthorViewset, basename='author')

urlpatterns = [
    path('', include(router.urls)),
]
