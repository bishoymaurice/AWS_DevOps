#!/bin/bash

DOCKER_IMAGE=bishoy/sampleapp
DOCKER_TAG=v1.0.0
DOCKER_PATH=${DOCKER_IMAGE}:${DOCKER_TAG}

install:
	pip install --upgrade pip &&\
		pip install -r requirements.txt

lint:
	hadolint Dockerfile
	html_lint.py ./app/index.html

build:
	docker build -t ${DOCKER_PATH} --tag=${DOCKER_TAG} .

push:
	echo ${DOCKERHUB_PASS} | docker login -u ${DOCKERHUB_USERNAME} --password-stdin
	docker push $DOCKER_PATH