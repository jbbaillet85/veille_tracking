from django.contrib import admin
from .models import Edition


class EditionAdmin(admin.ModelAdmin):
    list_display = ("name", "slug")
    search_fields = ["name"]

admin.site.register(Edition, EditionAdmin)