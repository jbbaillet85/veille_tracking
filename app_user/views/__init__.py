from django.shortcuts import redirect, render
from django.contrib.auth import login
from app_user.views.forms import RegisterForm


def register(request):
    context = {}
    if request.method == "POST":
        form = RegisterForm(request.POST)
        if form.is_valid():
            form.cleaned_data
            user = form.save()
            login(request, user)
            return redirect("space_user")
        else:
            context["errors"] = form.errors
    context["form"] = RegisterForm()
    return render(request, "app_user/register.html", context=context)
