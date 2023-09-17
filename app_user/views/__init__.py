from django.urls import reverse_lazy
from django.views.generic import DeleteView
from django.contrib.auth.mixins import LoginRequiredMixin
from django.contrib.auth import get_user_model


class DeleteUserView(LoginRequiredMixin, DeleteView):
    model = get_user_model()
    template_name = 'app_user/delete_user.html'
    success_url = reverse_lazy('homepage')

    def get_object(self, queryset=None):
        return self.request.user
