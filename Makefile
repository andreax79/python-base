SHELL=/bin/bash -e
PROJECT=todo

help:
	@echo - make ruff ------- Format code and sort imports
	@echo - make lint ------- Run lint
	@echo - make typecheck -- Typecheck
	@echo - make test ------- Run test
	@echo - make coverage --- Run tests coverage
	@echo - make clean ------ Clean virtual environment
	@echo - make venv ------- Create virtual environment

.PHONY: ruff
ruff:
	uv run ruff format $(PROJECT) tests

.PHONY: lint
lint:
	uv run ruff check $(PROJECT) tests

.PHONY: typecheck
typecheck:
	uv run mypy --strict --no-warn-unused-ignores $(PROJECT)

.PHONY: coverage
coverage:
	uv run pytest --cov --cov-report=term-missing

.PHONY: test
test:
	uv run pytest

.PHONY: clean
clean:
	-rm -rf build dist .venv *.egg-info

.PHONY: venv
venv:
	uv venv
	uv pip install -e .
	uv pip install -e ".[dev]"
