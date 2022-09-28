from django.urls import path
from django.views.generic import ListView
from app_library.views import createLibrary, saveCurrentPage, CreateLibraryView
from .models import Library

urlpatterns = [
    path(
        "library",
        ListView.as_view(
            template_name="app_library/library.html",
            model=Library,
            paginate_by=21,
            ordering=["-id"],
        ),
        name="library",
    ),
    path("createLibrary", createLibrary, name="createLibrary"),
    path("saveCurrentPage", saveCurrentPage, name="saveCurrentPage"),
]
