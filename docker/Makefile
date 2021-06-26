#!/bin/bash

DOCKER_IMAGE=bishoy/sampleapp
DOCKER_TAG=TARGET_TAG
DOCKER_PATH=${DOCKER_IMAGE}:${DOCKER_TAG}

install:
	pip install --upgrade pip &&\
		pip install -r requirements.txt

lint:
	hadolint ./Dockerfile
	html_lint.py ./app/index.html

build:
	docker build -t ${DOCKER_PATH} --tag=${DOCKER_TAG} .

push:
	echo "${DOCKERHUB_PASSWORD}" | docker login -u "${DOCKERHUB_USERNAME}" --password-stdin
	docker push ${DOCKER_PATH}