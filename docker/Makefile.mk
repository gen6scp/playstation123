SHELL=/bin/bash

VENDOR=gen6scp
VCS_NAME=playstation123

SUPPORT_FUNCTIONS := $(shell dirname $(abspath $(lastword $(MAKEFILE_LIST))))/.make-support

.PHONY: build pre-build do-build post-build \
	    push pre-push do-push post-push \
	    clean

build: pre-build do-build post-build

pre-build:

do-build:
	@export DOCKER_BUILD_CONTEXT="$(DOCKER_BUILD_CONTEXT)" ; \
	export DOCKER_FILE_PATH="$(DOCKER_FILE_PATH)" ; \
	export IMAGE="$(IMAGE)" ; \
	export NAME="$(NAME)" ; \
	export REGISTRY_HOST="$(REGISTRY_HOST)" ; \
	export TAG_MAJOR="$(TAG_MAJOR)" ; \
	export TAG_MINOR="$(TAG_MINOR)" ; \
	export VCS_NAME="$(VCS_NAME)" ; \
	export VCS_HOST="$(VCS_HOST)" ; \
	export VCS_URL="$(VCS_URL)" ; \
	export VCS_REF="$(VCS_REF)" ; \
	export VENDOR="$(VENDOR)" ; \
	\
	. $(SUPPORT_FUNCTIONS) ; \
	\
	dockerBuild ; \

post-build:

push: pre-push do-push post-push

pre-push:

do-push:
	@export REGISTRY_HOST="$(REGISTRY_HOST)" ; \
	export IMAGE="$(IMAGE)" ; \
	export NAME="$(NAME)" ; \
	export TAG_MAJOR="$(TAG_MAJOR)" ; \
	export TAG_MINOR="$(TAG_MINOR)" ; \
	export VENDOR="$(VENDOR)" ; \
	\
	. $(SUPPORT_FUNCTIONS) ; \
	\
	dockerPush ; \

post-push:

docs:
	@export REGISTRY_HOST="$(REGISTRY_HOST)" ; \
	export IMAGE="$(IMAGE)" ; \
	export NAME="$(NAME)" ; \
	export VENDOR="$(VENDOR)" ; \
	\
	. $(SUPPORT_FUNCTIONS) ; \
	\
	updateDescription ; \

clean:
	rm -f build*.log build*.properties
