from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth import get_user_model


class RegisterForm(UserCreationForm):
    """
    A form for creating new users. Inherits from Django's built-in 
    UserCreationForm and extends it to allow the use of email as the 
    username.
    """
    
    class Meta(UserCreationForm.Meta):
        """
        Inner class to specify the model and fields for the form.
        """
        model = get_user_model()
        fields = ("email",)

