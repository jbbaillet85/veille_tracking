from django.urls import reverse, reverse_lazy
from django.views.generic import CreateView, DeleteView
from django.contrib.auth.mixins import LoginRequiredMixin
from app_user.views.forms import RegisterForm
from django.contrib.auth import get_user_model


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

    model = get_user_model()
    template_name = "app_user/register.html"
    form_class = RegisterForm

    def get_success_url(self) -> str:
        """
        Return the URL to be redirected to after successful form submission.

        Returns:
            str: The URL of the success page.
        """
        return reverse("library")


class DeleteUserView(LoginRequiredMixin, DeleteView):
    model = get_user_model()
    template_name = 'app_user/delete_user.html'
    success_url = reverse_lazy('login')

    def get_object(self, queryset=None):
        return self.request.user
