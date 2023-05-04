from django.urls import path
from app_user.views import RegisterUserView, DeleteUserView
from django.views.generic import TemplateView
from django.contrib.auth.views import LoginView, LogoutView

urlpatterns = [
    path(
        "register/",
        RegisterUserView.as_view(),
        name="register",
    ),
    path(
        "login/",
        LoginView.as_view(template_name="app_user/login.html"),
        name="login",
    ),
    path(
        "logout/",
        LogoutView.as_view(template_name="homepage/homepage.html"),
        name="logout",
    ),
    path(
        "space_user/",
        TemplateView.as_view(template_name="app_user/space_user.html"),
        name="space_user",
    ),
    path('delete_user/', DeleteUserView.as_view(), name='delete_user'),
]
