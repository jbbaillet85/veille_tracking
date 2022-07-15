"""config URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from re import template
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
    path("user/", include("app_user.urls")),
    path("book/", include("app_books.urls")),
] + static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)
