from django.shortcuts import redirect
from django.contrib.auth.decorators import login_required
from django.shortcuts import get_object_or_404
from django.views.generic import CreateView
from app_library.models import Library
from app_books.models import Book
from app_user.models import User

class CreateLibraryView(CreateView):
    """A view for creating a library for a user and a book.
    This view uses the CreateView generic view and is associated with the Library model.
    """
    model = Library
    template_name = "app_library/library.html"
    fields = ["book", "user"]

@login_required
def createLibrary(request):
    """A view for creating a library for a user and a book.
    This view is decorator with the @login_required decorator, which requires that the user be logged in to access this view.
    """
    if request.method == "POST":
        # Get the book's slug from the request
        slug = request.POST["book_slug"]
        # Get the book that matches the given slug
        book = Book.objects.filter(slug=slug)
        # Get the current user from the request
        user: User = request.user
        # Get or create the library for the user and book
        library, _ = Library.objects.get_or_create(book=book[0], user=user)
        # Redirect to the library view
        return redirect("library")


@login_required
def saveCurrentPage(request):
    """A view for saving the current page of a book for a user.
    This view is decorator with the @login_required decorator, which requires that the user be logged in to access this view.
    """
    if request.method == "POST":
        # Get the book's slug from the request
        slug = request.POST["book_slug"]
        # Get the current user from the request
        user = request.user
        # Get the current page from the request
        current_page = request.POST["current_page"]
        # Get the book that matches the given slug
        book = get_object_or_404(Book, slug=slug)
        # Get the library for the user and book
        library = Library.objects.filter(book=book, user=user)
        # Update the library with the current page
        library.update(book=book, user=user, current_page=current_page)
        # Redirect to the library view
        return redirect("library")
