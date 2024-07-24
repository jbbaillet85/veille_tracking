from django.contrib import admin

from .models import Author, Book, Category, Edition


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


class BookAdmin(admin.ModelAdmin):
    list_display = (
        "title",
        "count_pages",
        "ISBN",
        "author",
        "edition",
        "submitted_by",
        "is_approved",
    )
    search_fields = [
        "title",
        "count_pages",
        "ISBN",
        "author",
        "edition",
        "submitted_by",
    ]
    list_filter = ("author", "edition", "category", "is_approved", "submitted_by")
    list_editable = ("is_approved",)


admin.site.register(Book, BookAdmin)
