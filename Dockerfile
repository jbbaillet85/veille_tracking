# Utiliser une image Python 3.12 officielle
FROM python:3.12-slim

# Installer pipenv
RUN pip install pipenv

# Définir le répertoire de travail
WORKDIR /app

# Copier les fichiers Pipfile et Pipfile.lock
COPY Pipfile Pipfile.lock /app/

# Installer les dépendances
RUN pipenv install --deploy --ignore-pipfile

# Copier le reste du code de l'application
COPY . /app/

# Exposer le port utilisé par l'application
EXPOSE 8000

# Commande pour lancer l'application
CMD ["pipenv", "run", "gunicorn", "--bind", "0.0.0.0:8000", "config.wsgi:application"]
