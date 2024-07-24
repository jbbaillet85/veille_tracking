from django.conf import settings
from django.conf.urls.static import static
from django.contrib import admin
from django.urls import include, path
from django.views.generic import ListView, TemplateView

from app_books.models import Book

urlpatterns = [
    path("admin/", admin.site.urls),
    path(
        "",
        ListView.as_view(
            template_name="homepage/homepage.html",
            queryset=Book.objects.filter(is_approved=True).order_by("-id"),
            paginate_by=9,
            ordering=["-id"],
        ),
        name="homepage",
    ),
    path(
        "credits",
        TemplateView.as_view(template_name="credits/credits.html"),
        name="credits",
    ),
    path(
        "contribution",
        TemplateView.as_view(template_name="contribution/contribution.html"),
        name="contribution",
    ),
    path("book/", include("app_books.urls")),
    path("library/", include("app_library.urls")),
    path("commentary/", include("app_commentary.urls")),
    path("user/", include("app_user.urls")),
    path("accounts/", include("allauth.urls")),
] + static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)
