# Recipes
@default:
  just --list

test *ARGS:
    python -m manage check
    python -m manage makemigrations --dry-run --check --noinput
    python -m coverage run --source=django_tasks_db -m manage test --shuffle --noinput {{ ARGS }}
    python -m coverage report
    python -m coverage html

format:
    python -m ruff check django_tasks_db tests --fix
    python -m ruff format django_tasks_db tests

lint:
    python -m ruff check django_tasks_db tests
    python -m ruff format django_tasks_db tests --check
    python -m mypy django_tasks_db tests
