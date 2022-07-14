from django.contrib import admin
from .models import Edition, Category


class EditionAdmin(admin.ModelAdmin):
    list_display = ("name", "slug")
    search_fields = ["name"]

admin.site.register(Edition, EditionAdmin)


class CategoryAdmin(admin.ModelAdmin):
    list_display = ("name", "slug")
    search_fields = ["name"]


admin.site.register(Category, CategoryAdmin)
