setup:
	python -m venv .venv

install:
	source ~/.venv/bin/activate
	python -m pip install --upgrade pip && \
		python -m pip install -r requirements.txt

lint:
	source ~/.venv/bin/activate
	hadolint NginX.Dockerfile

all: setup install lint
