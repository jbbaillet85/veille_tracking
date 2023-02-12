from django.urls import reverse
from django.views.generic import CreateView
from app_user.views.forms import RegisterForm
from app_user.models import User


class RegisterUserView(CreateView):
    """
    View for handling user registration.
    model: User
        The model to use for user creation.
    template_name: str
        The name of the template to be used to render the form.
    form_class: RegisterForm
        The form class to be used for user registration.
    """

    model = User
    template_name = "app_user/register.html"
    form_class = RegisterForm

    def get_success_url(self) -> str:
        """
        Return the URL to be redirected to after successful form submission.

        Returns:
            str: The URL of the success page.
        """
        return reverse("library")
