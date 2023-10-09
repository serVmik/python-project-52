MANAGE := poetry run ./manage.py

migrate:
	@$(MANAGE) makemigrations
	@$(MANAGE) migrate

add-data:
	@$(MANAGE) add_test_data

dev:
	@$(MANAGE) runserver

mess:
	@$(MANAGE) makemessages -l ru -i venv

compile:
	@$(MANAGE) compilemessages

lint:
	poetry run flake8

test:
	@$(MANAGE) test task_manager/tests/

test-dev:
	@$(MANAGE) test task_manager.tests.test_end2end

test-coverage:
	poetry run coverage run --source="task_manager" manage.py test task_manager
	poetry run coverage xml

test-playwright:
	@$(MANAGE) test task_manager.tests_playwright

coverage:
	coverage run --source='.' ./manage.py test .
	coverage report
	coverage html

check: lint test

install:
	poetry install

build:
	poetry build

publish:
	poetry publish --dry-run

package-install:
	python3 -m pip install dist/*.whl

.PHONY: dev lint test test-coverage check install build publish package-install