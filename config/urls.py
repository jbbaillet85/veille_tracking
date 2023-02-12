from django.contrib import admin
from django.urls import path, include
from django.views.generic import TemplateView, ListView
from django.conf import settings
from django.conf.urls.static import static
from app_books.models import Book

urlpatterns = [
    path("admin/", admin.site.urls),
    path(
        "",
        ListView.as_view(
            template_name="homepage/homepage.html",
            model=Book,
            paginate_by=3,
            ordering=["-id"],
        ),
        name="homepage",
    ),
    path(
        "credits",
        TemplateView.as_view(template_name="credits/credits.html"),
        name="credits",
    ),
    path("user/", include("app_user.urls")),
    path("book/", include("app_books.urls")),
    path("library/", include("app_library.urls")),
    path("api/", include("api.urls")),
] + static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)
