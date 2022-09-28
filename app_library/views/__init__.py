from django.shortcuts import redirect
from django.contrib.auth.decorators import login_required
from django.shortcuts import get_object_or_404
from django.views.generic import CreateView
from app_library.models import Library
from app_books.models import Book
from app_user.models import User


class CreateLibraryView(CreateView):
    model = Library
    template_name = "app_library/library.html"
    fields = ["book", "user"]


@login_required
def createLibrary(request):
    """Create Library

    Args:
        request (_type_): _description_

    Returns:
        _type_: _description_
    """
    if request.method == "POST":
        slug = request.POST["book_slug"]
        book = Book.objects.filter(slug=slug)
        user: User = request.user
        library, _ = Library.objects.get_or_create(book=book[0], user=user)
        return redirect("library")


@login_required
def saveCurrentPage(request):
    """_summary_

    Args:
        request (_type_): _description_

    Returns:
        _type_: _description_
    """
    if request.method == "POST":
        slug = request.POST["book_slug"]
        user = request.user
        current_page = request.POST["current_page"]
        book = get_object_or_404(Book, slug=slug)
        library = Library.objects.filter(book=book, user=user)
        library.update(book=book, user=user, current_page=current_page)
        return redirect("library")
