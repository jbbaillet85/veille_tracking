from django.contrib import admin
from app_user.models import User

class UserAdmin(admin.ModelAdmin):
    """Class that represents the model of the User in the Django's admin interface."""

    list_display = ("email",)
    search_fields = ["email"]
    ordering = ("email",)

admin.site.register(User, UserAdmin)
