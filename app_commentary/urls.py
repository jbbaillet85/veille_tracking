from django.urls import path
from app_commentary.views import CommentaryCreateView, CommentaryUpdateView

urlpatterns = [
    path('createCommentary/',
         CommentaryCreateView.as_view(), name='createCommentary'),
    path('updateCommentary/<int:pk>/',
         CommentaryUpdateView.as_view(), name='updateCommentary'),
]
