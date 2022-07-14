from django.contrib import admin
from .models import Edition, Category, Author


class EditionAdmin(admin.ModelAdmin):
    list_display = ("name", "slug")
    search_fields = ["name"]


admin.site.register(Edition, EditionAdmin)


class CategoryAdmin(admin.ModelAdmin):
    list_display = ("name", "slug")
    search_fields = ["name"]


admin.site.register(Category, CategoryAdmin)

class AuthorAdmin(admin.ModelAdmin):
    list_display = ("name", "lastname", "contact")
    search_fields = ["name", "lastname", "contact"]


admin.site.register(Author, AuthorAdmin)
