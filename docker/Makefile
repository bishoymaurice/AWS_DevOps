tag=v1.0.0
dockerpath=bishoy/sampleapp:${tag}

lint:
	docker run --rm -i hadolint/hadolint < NginX.Dockerfile

build:
	docker build -t bishoy/sampleapp:${tag} --tag=${tag} NginX.Dockerfile

push:
	docker image push ${dockerpath}