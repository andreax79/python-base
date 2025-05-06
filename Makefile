SHELL=/bin/bash -e

help:
	@echo - make isort
	@echo - make black
	@echo - make clean
	@echo - make venv

isort:
	isort --profile black *.py

black: isort
	black *.py

clean:
	-rm -rf build dist bin lib lib64 include share pyvenv.cfg *.egg-info

venv:
	python3 -m venv . || python3 -m virtualenv .
	. bin/activate; pip install -Ur requirements.txt
	. bin/activate; pip install -Ur requirements-dev.txt
