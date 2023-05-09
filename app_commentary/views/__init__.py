from django.shortcuts import get_object_or_404
from django.views.generic import CreateView, UpdateView, DeleteView
from django.contrib.auth.mixins import LoginRequiredMixin
from django.urls import reverse_lazy
from django.contrib import messages
from app_books.models import Book
from app_commentary.models import Commentary
from app_commentary.views.form import CommentaryForm


class CommentaryCreateView(LoginRequiredMixin, CreateView):
    model = Commentary
    form_class = CommentaryForm
    template_name = 'app_commentary/createCommentary.html'

    def form_valid(self, form):
        book_isbn = self.request.POST.get('isbn')
        book = get_object_or_404(Book, ISBN=book_isbn)
        form.instance.book = book
        form.instance.user = self.request.user
        return super().form_valid(form)

    def get_success_url(self):
        return reverse_lazy('library')

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['book'] = Book.objects.filter(
            ISBN=self.request.POST.get('isbn')).first()
        context['user'] = self.request.user
        return context


class CommentaryUpdateView(LoginRequiredMixin, UpdateView):
    model = Commentary
    form_class = CommentaryForm
    template_name = 'app_commentary/updateCommentary.html'
    success_url = reverse_lazy('library')
    pk_url_kwarg = 'pk'

    def form_valid(self, form):
        messages.success(self.request,
                         "Le commentaire a été mis à jour avec succès.")
        return super().form_valid(form)

    def form_invalid(self, form):
        messages.error(self.request,
                       "Erreur lors de la mise à jour du commentaire.")
        return super().form_invalid(form)


class CommentaryDeleteView(LoginRequiredMixin, DeleteView):
    model = Commentary
    success_url = reverse_lazy('library')
    pk_url_kwarg = 'pk'
    template_name = 'app_commentary/deleteCommentary.html'