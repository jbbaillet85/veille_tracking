from django.urls import path
from app_library.views import createLibrary, saveCurrentPage, LibraryView


urlpatterns = [
    path(
        "library",
        LibraryView.as_view(),
        name="library",
    ),
    path("createLibrary", createLibrary, name="createLibrary"),
    path("saveCurrentPage", saveCurrentPage, name="saveCurrentPage"),
]
