[![wakatime](https://wakatime.com/badge/user/648b0556-0c0e-4e9d-b952-2bea950dabe6/project/ce91cfb1-ac21-4c0b-a1dd-dd75004877be.svg)](https://wakatime.com/badge/user/648b0556-0c0e-4e9d-b952-2bea950dabe6/project/ce91cfb1-ac21-4c0b-a1dd-dd75004877be)
[![Codacy Badge](https://app.codacy.com/project/badge/Grade/e2c07d13eb674eb88288901cba08ba52)](https://www.codacy.com/gh/jbbaillet85/veille_tracking/dashboard?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=jbbaillet85/veille_tracking&amp;utm_campaign=Badge_Grade)



# veille_tracking
application de tracking de lecture de livres
 ![livres](/static/assets/img/bibliotheque.jpg "livres")

# Logiciels
- [Python 3.10](https://www.python.org/ "python")
- [Django 4](https://www.djangoproject.com/ "django")
- [Postgresql 14](https://www.postgresql.fr/ "Postgresql")
- [draw.io](https://draw-io.fr.softonic.com/ "draw.io")
# Tableau Trello
https://trello.com/b/kXOWpHUQ/veilletraking#

# Modèles

- Book
  - title
  - slug
  - count of pages
  - current_page
  - ISBN
  - couverture
  - edition (foreignkey)
  - authore (foreignkey)
  - url
  - category (foreignkey)
- Category
  - name
  - slug
- Edition
  - name
  - slug
- Author
  - name
  - lastname
  - slug
- User
  - name
  - lastename
  - email

![diagrame entité association](/doc/association_entity_diagram.jpg "livres")

# Fonctionalités

[X] Afficher une page d'accueil  
[ ] Créer un compte utilisateur  
[ ] Se connecter à son compte utilisateur  
[ ] Réinitialiser le mot de passe en cas d'oublis  
[ ] Ajouter un livre à sa bibliothèque  
[ ] Supprimer un livre de sa bibliothèque  
[ ] Tracker la lecture d'un livre  
[ ] Afficher l'avancé de la lecture du livre  
[ ] Barre de recherche de l'application  
[ ] Afficher le catalogue de livres  
[X] Afficher le détail d'un livre  


# Commandes
```
pip install pipenv
pipenv --python 3.10
pipenv install django
pipenv install --dev flake8 pytest-django
pipenv run pip freeze > requirements.txt
pipenv run python manage.py runserver
pipenv run python manage.py makemigrations
pipenv run python manage.py migrate
pipenv run python manage.py collectstatic
pipenv run pytest
pipenv run pytest --cov=. --cov-report html
```
