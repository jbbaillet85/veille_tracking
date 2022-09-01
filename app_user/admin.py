from django.contrib import admin
from app_user.models import User


class UserAdmin(admin.ModelAdmin):
    list_display = ("email",)
    search_fields = ["email"]
    ordering = ("email",)


admin.site.register(User, UserAdmin)
