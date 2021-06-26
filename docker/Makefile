install:
	pip install --upgrade pip &&\
		pip install -r requirements.txt

lint:
	hadolint Dockerfile
	html_lint.py ../app/index.html

all: install lint
