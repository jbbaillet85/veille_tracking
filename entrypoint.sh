#!/bin/sh

if [ "$DATABASE" = "veille" ]
then
    echo "Waiting for postgres..."

    while ! nc -z "$SQL_HOST" "$SQL_PORT"; do
      sleep 0.1
    done

    echo "PostgreSQL started"
fi

python manage.py flush --no-input
python manage.py migrate
python manage.py createsuperuser --email="$EMAIL_USER" --noinput
python manage.py loaddata books_backup.json

exec "$@"
