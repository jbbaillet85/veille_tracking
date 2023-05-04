from django.urls import path
from app_library.views import createLibrary, saveCurrentPage, LibraryView
from app_library.views import delete_library

urlpatterns = [
    path(
        "library",
        LibraryView.as_view(),
        name="library",
    ),
    path("createLibrary", createLibrary, name="createLibrary"),
    path("saveCurrentPage", saveCurrentPage, name="saveCurrentPage"),
    path("delete_library", delete_library, name="delete_library"),
]
