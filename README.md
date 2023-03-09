[![wakatime](https://wakatime.com/badge/user/648b0556-0c0e-4e9d-b952-2bea950dabe6/project/ce91cfb1-ac21-4c0b-a1dd-dd75004877be.svg)](https://wakatime.com/badge/user/648b0556-0c0e-4e9d-b952-2bea950dabe6/project/ce91cfb1-ac21-4c0b-a1dd-dd75004877be)
[![Codacy Badge](https://app.codacy.com/project/badge/Grade/e2c07d13eb674eb88288901cba08ba52)](https://www.codacy.com/gh/jbbaillet85/veille_tracking/dashboard?utm_source=github.com\&utm_medium=referral\&utm_content=jbbaillet85/veille_tracking\&utm_campaign=Badge_Grade)
![workflow ci](https://github.com/jbbaillet85/veille_tracking/actions/workflows/django.yaml/badge.svg)

# veille\_tracking

Site en production: http://146.59.150.169/

application de tracking de lecture de livres
![livres](/static/assets/img/bibliotheque.jpg "livres")

# Logiciels

*   [Python 3.10](https://www.python.org/ "python")
*   [Django 4](https://www.djangoproject.com/ "django")
*   [Postgresql 14](https://www.postgresql.fr/ "Postgresql")
*   [Docker 20.10](https://www.docker.com/ "Docker")
*   [draw.io](https://draw-io.fr.softonic.com/ "draw.io")

# Tableau Trello

https://trello.com/b/kXOWpHUQ/veilletraking#

# Modèles

*   Book
    *   title
    *   slug
    *   count of pages
    *   current\_page
    *   ISBN
    *   couverture
    *   edition (foreignkey)
    *   authore (foreignkey)
    *   url
    *   category (foreignkey)
*   Category
    *   name
    *   slug
*   Edition
    *   name
    *   slug
*   Author
    *   name
    *   lastname
    *   slug
*   User
    *   name
    *   lastename
    *   email

![diagrame entité association](/doc/association_entity_diagram.jpg "livres")

# Fonctionalités

\[X] Afficher une page d'accueil\
\[X] Créer un compte utilisateur\
\[X] Se connecter à son compte utilisateur\
\[ ] Réinitialiser le mot de passe en cas d'oublis\
\[X] Ajouter un livre à sa bibliothèque\
\[ ] Supprimer un livre de sa bibliothèque\
\[X] Tracker la lecture d'un livre\
\[X] Afficher l'avancée de la lecture du livre\
\[ ] Barre de recherche de l'application\
\[X] Afficher le catalogue de livres\
\[X] Afficher le détail d'un livre

# Commandes Pipenv

    pip install pipenv
    pipenv --python 3.10
    pipenv install django
    pipenv install --dev flake8 pytest-django
    pipenv run pip freeze > requirements_dev.txt
    pipenv lock -r > requirements.txt
    pipenv run python manage.py runserver
    pipenv run python manage.py makemigrations
    pipenv run python manage.py migrate
    pipenv run python manage.py collectstatic
    pipenv run pytest
    pipenv run pytest --cov=. --cov-report html

# Commandes docker

renommer le fichier .env\_example en .env et y mettre les variables d'environnement.

Sous windows:lancer docker-deskop
Dans le terminal
```
    docker-compose up --build
```
Puis pour accéder à l'application, aller dans le navigateur à l'adresse:
```http://localhost:8000```.
Pour accéder à l'administration, aller à l'adresse:
```http://localhost:8000/admin```