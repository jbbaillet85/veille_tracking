[![wakatime](https://wakatime.com/badge/user/648b0556-0c0e-4e9d-b952-2bea950dabe6/project/ce91cfb1-ac21-4c0b-a1dd-dd75004877be.svg)](https://wakatime.com/badge/user/648b0556-0c0e-4e9d-b952-2bea950dabe6/project/ce91cfb1-ac21-4c0b-a1dd-dd75004877be)
[![Codacy Badge](https://app.codacy.com/project/badge/Grade/e2c07d13eb674eb88288901cba08ba52)](https://www.codacy.com/gh/jbbaillet85/veille_tracking/dashboard?utm_source=github.com\&utm_medium=referral\&utm_content=jbbaillet85/veille_tracking\&utm_campaign=Badge_Grade)
![workflow ci](https://github.com/jbbaillet85/veille_tracking/actions/workflows/django.yaml/badge.svg)

# veille\_tracking

Site en production: http://146.59.150.169/

application de tracking de lecture de livres
![livres](/static/assets/img/bibliotheque.jpg "livres")

L'application Veille Tracking a pour objectif d'offrir une solution spécifique pour les informaticiens qui cherchent à rester à la pointe de l'actualité technologique en matière de livres d'informatique en français.\
En recommandant des livres d'informatique pertinents et de haute qualité, Veille Tracking aide les professionnels à se tenir informés des dernières avancées dans leur domaine, à améliorer leurs compétences et à rester compétitifs sur le marché du travail.\
En facilitant l'accès à des ressources informatiques de qualité, l'application contribue à renforcer la formation et l'éducation des professionnels de l'informatique, ce qui se traduit par un impact social positif à long terme.\
De plus, Veille Tracking crée une communauté de lecteurs passionnés grâce à son club de lecture en ligne.\
Les utilisateurs peuvent partager leurs opinions sur les livres, discuter des dernières tendances en matière de technologie, proposer des livres pour le catalogue et interagir avec d'autres membres de la communauté. Cette dimension communautaire de l'application encourage les interactions entre professionnels, favorisant ainsi l'apprentissage collaboratif et le partage de connaissances.\
En fin de compte, Veille Tracking aide les informaticiens à relever les défis complexes du monde numérique d'aujourd'hui, en améliorant leurs performances. Cette application communautaire en ligne permet également de renforcer les liens entre les membres de la communauté, créant ainsi un environnement favorable à l'épanouissement professionnel et personnel des utilisateurs.
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
\[X] Pouvoir suppimer son compte utilisateur\
\[ ] Réinitialiser le mot de passe en cas d'oublis\
\[X] Ajouter un livre à sa bibliothèque\
\[X] Supprimer un livre de sa bibliothèque\
\[X] Tracker la lecture d'un livre\
\[X] Afficher l'avancée de la lecture du livre\
\[X] Barre de recherche de l'application\
\[X] Afficher le catalogue de livres\
\[X] Afficher le détail d'un livre\
\[X] Proposer un livre au catalogue\
\[X] Ajouter un commentaire sur la page de détail du livre\
\[X] Ajouter une évaluation d'un livre\
\[X] Contribuer au projet via un sondage via la page contribution\
\[X] Contribuer au projet via les github-issues\

![fonctionalités](/doc/parcour%20utilisateur.jpg "Fonctionalités")

# Commandes Pipenv

    pip install pipenv
    pipenv --python 3.10
    pipenv install django
    pipenv install --dev flake8 pytest-django
    pipenv run pip freeze > requirements_dev.txt
    pipenv lock -r > requirements.txt
    pipenv lock --requirements --dev > requirements_dev.txt
    pipenv run python manage.py runserver
    pipenv run python manage.py makemigrations
    pipenv run python manage.py migrate
    pipenv run python manage.py collectstatic
    pipenv run python manage.py loaddata books_backup.json
    pipenv run pytest
    pipenv run pytest --cov=. --cov-report html
