.ONESHELL:

.DEFAULT_GOAL := run

# SHELL := /bin/bash

VENV_DIR = .venv
PYTHON = $(VENV_DIR)/Scripts/python
PIP = $(VENV_DIR)/Scripts/pip

create_and_activate_venv:
	python -m venv $(VENV_DIR)
	bash -c "source $(VENV_DIR)/Scripts/activate"

install: requirements.txt create_and_activate_venv
	$(PYTHON) -m pip install --upgrade pip
	$(PIP) install -r requirements.txt

run: install
	$(PYTHON) main.py

clean:
	rm -rf __pycache__
	rm -rf $(VENV_DIR)
