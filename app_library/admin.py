from django.contrib import admin
from .models import Library


# Register your models here.
class LibraryAdmin(admin.ModelAdmin):
    list_display = ("user", "book")
    search_fields = ["user", "book"]


admin.site.register(Library, LibraryAdmin)
