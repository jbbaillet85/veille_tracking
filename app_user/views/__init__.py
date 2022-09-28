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


# def register(request):
#     context = {}
#     if request.method == "POST":
#         form = RegisterForm(request.POST)
#         if form.is_valid():
#             form.cleaned_data
#             user:User = form.save()
#             login(request, user)
#             return redirect("library")
#         else:
#             context["errors"] = form.errors
#     context["form"] = RegisterForm()
#     return render(request, "app_user/register.html", context=context)
