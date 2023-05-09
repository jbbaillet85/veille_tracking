from django.contrib import admin
from app_commentary.models import Commentary


class CommentaryAdmin(admin.ModelAdmin):
    list_display = ("user", "book", "title", "notation", "commentary")
    search_fields = ["user", "book", "title", "notation", "commentary"]


admin.site.register(Commentary, CommentaryAdmin)
