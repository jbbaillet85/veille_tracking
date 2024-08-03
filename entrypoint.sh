#!/bin/sh

# Wait for PostgreSQL to be available
if [ "$DATABASE" = "postgres" ]
then
    echo "Waiting for postgres..."

    while ! nc -z $SQL_HOST $SQL_PORT; do
      sleep 0.1
    done

    echo "PostgreSQL started"
fi

cd /app
pipenv install

# Check if manage.py is executable and the environment is correct
if [ ! -f manage.py ]; then
    echo "manage.py not found"
    exit 1
fi

echo "Checking pipenv environment..."
pipenv --venv
if [ $? -ne 0 ]; then
    echo "pipenv environment not set up correctly"
    exit 1
fi

echo "Checking Django installation..."
pipenv run python -m django --version
if [ $? -ne 0 ]; then
    echo "Django not installed correctly in pipenv environment"
    exit 1
fi
mkdir -p staticfiles
pipenv run python manage.py flush --no-input
pipenv run python manage.py migrate
pipenv run python manage.py collectstatic --no-input --clear

exec "$@"
