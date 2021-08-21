.PHONY : docker-prune docker-check docker-build docker-push docker-login

IMG_NAME := azinfra
VCS_URL := $(shell git remote get-url --push gh)
VCS_REF := $(shell git rev-parse --short HEAD)
BUILD_DATE := $(shell date -u +"%Y-%m-%dT%H:%M:%SZ")
TAG_DATE := $(shell date -u +"%Y%m%d")
# Line below prompts user for a value, stores in a Make variable.
# PASSWORD ?= $(shell bash -c 'read -s -p "Password: " pwd; echo $$pwd')
# Use BuildKit
export DOCKER_BUILDKIT := 1

docker-login :
	@pass hub.docker.com/blueogive | docker login -u blueogive --password-stdin
 
docker-prune :
	@echo Pruning Docker images/containers/networks not in use
	docker system prune

docker-check :
	@echo Computing reclaimable space consumed by Docker artifacts
	docker system df

docker-build: Dockerfile docker-login
	@docker build \
	--build-arg VCS_URL=$(VCS_URL) \
	--build-arg VCS_REF=$(VCS_REF) \
	--build-arg BUILD_DATE=$(BUILD_DATE) \
	--tag blueogive/${IMG_NAME}:$(TAG_DATE) \
	--tag blueogive/${IMG_NAME}:latest .

docker-push : docker-build
	@docker push blueogive/${IMG_NAME}:$(TAG_DATE)
	@docker push blueogive/${IMG_NAME}:latest
