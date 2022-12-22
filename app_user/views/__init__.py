from django.urls import reverse
from django.views.generic import CreateView
from app_user.views.forms import RegisterForm
from app_user.models import User


class RegisterUserView(CreateView):
    model = User
    template_name = "app_user/register.html"
    form_class = RegisterForm

    def get_success_url(self) -> str:
        return reverse("library")
