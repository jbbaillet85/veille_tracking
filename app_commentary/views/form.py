from django import forms
from app_commentary.models import Commentary


class CommentaryForm(forms.ModelForm):
    class Meta:
        model = Commentary
        fields = ['title', 'notation', 'commentary']

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.fields['title'].widget.attrs.update({'class': 'form-control'})
        self.fields['notation'].widget.attrs.update({'class': 'form-control'})
        self.fields['commentary'].widget.attrs.update({'class': 'form-control'}
                                                      )
