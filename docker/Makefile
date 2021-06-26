DOCKER_IMAGE_TAG=v1.0.0
DOCKER_PATH=bishoy/sampleapp:${DOCKER_IMAGE_TAG}

install:
	pip install --upgrade pip &&\
		pip install -r requirements.txt

lint:
	hadolint Dockerfile
	html_lint.py ../app/index.html

build:
	docker build -t ${DOCKER_PATH} --tag=${DOCKER_IMAGE_TAG} .

push:
	docker login -u $DOCKERHUB_USERNAME -p $DOCKERHUB_PASSWORD
	docker image push ${DOCKER_PATH}