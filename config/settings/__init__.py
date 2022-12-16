from pathlib import Path
import os

BASE_DIR = Path(__file__).resolve().parent.parent.parent
TEMPLATES_DIR = os.path.join(BASE_DIR, "templates")

SECRET_KEY = os.environ.get(
    "SECRET_KEY", default="0kv@@+4yi_*4)u_lfbd)kx4_(+y@!q52nd4a*rekkif8on&wg2"
)

DJANGO_SUPERUSER_PASSWORD= os.environ.get(
    "DJANGO_SUPERUSER_PASSWORD"
)

DEBUG = int(os.environ.get("DEBUG", default=True))

ALLOWED_HOSTS = os.environ.get(
    "DJANGO_ALLOWED_HOSTS", default="localhost 127.0.0.1"
).split(" ")

INSTALLED_APPS = [
    "django.contrib.admin",
    "django.contrib.auth",
    "django.contrib.contenttypes",
    "django.contrib.sessions",
    "django.contrib.messages",
    "django.contrib.staticfiles",
    "django.contrib.postgres",
    "app_books",
    "app_user",
    "app_library",
]

MIDDLEWARE = [
    "django.middleware.security.SecurityMiddleware",
    "django.contrib.sessions.middleware.SessionMiddleware",
    "django.middleware.common.CommonMiddleware",
    "django.middleware.csrf.CsrfViewMiddleware",
    "django.contrib.auth.middleware.AuthenticationMiddleware",
    "django.contrib.messages.middleware.MessageMiddleware",
    "django.middleware.clickjacking.XFrameOptionsMiddleware",
]

ROOT_URLCONF = "config.urls"

TEMPLATES = [
    {
        "BACKEND": "django.template.backends.django.DjangoTemplates",
        "DIRS": [
            TEMPLATES_DIR,
        ],
        "APP_DIRS": True,
        "OPTIONS": {
            "context_processors": [
                "django.template.context_processors.debug",
                "django.template.context_processors.request",
                "django.contrib.auth.context_processors.auth",
                "django.contrib.messages.context_processors.messages",
            ],
        },
    },
]

WSGI_APPLICATION = "config.wsgi.application"

DATABASES = {
    "default": {
        "ENGINE": os.environ.get("SQL_ENGINE", "django.db.backends.postgresql"), # noqa
        "NAME": os.environ.get("SQL_DATABASE", "veille"),
        "USER": os.environ.get("SQL_USER", "veille"),
        "PASSWORD": os.environ.get("SQL_PASSWORD", "veille"),
        "HOST": os.environ.get("SQL_HOST", "localhost"),
        "PORT": os.environ.get("SQL_PORT", "5432"),
    }
}


AUTH_PASSWORD_VALIDATORS = [
    {
        "NAME": "django.contrib.auth.password_validation.UserAttributeSimilarityValidator",  # noqa
    },
    {
        "NAME": "django.contrib.auth.password_validation.MinimumLengthValidator", # noqa
    },
    {
        "NAME": "django.contrib.auth.password_validation.CommonPasswordValidator", # noqa
    },
    {
        "NAME": "django.contrib.auth.password_validation.NumericPasswordValidator", # noqa
    },
]

AUTH_USER_MODEL = "app_user.User"
LOGIN_REDIRECT_URL = "homepage"

LANGUAGE_CODE = "fr-fr"
TIME_ZONE = "UTC"
USE_I18N = True
USE_TZ = True


STATIC_URL = "static/"
if DEBUG:
    STATICFILES_DIRS = [os.path.join(BASE_DIR, "static")]
else:
    STATIC_ROOT = os.path.join(BASE_DIR, "staticfiles")

DEFAULT_AUTO_FIELD = "django.db.models.BigAutoField"
