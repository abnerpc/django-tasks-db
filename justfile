# Recipes
@default:
  just --list

test *ARGS:
    coverage run --source=django_tasks_db manage.py test {{ ARGS }}
    coverage report
    coverage html

format:
    ruff check django_tasks_db tests --fix
    ruff format django_tasks_db tests

lint:
    ruff check django_tasks_db tests
    ruff format django_tasks_db tests --check
    mypy django_tasks_db tests
