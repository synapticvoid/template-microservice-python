.DEFAULT_GOAL := help

###############################################################################
# Variables
###############################################################################
DOCKER_COMPOSE := $(shell which docker) compose

###############################################################################
# Docker
###############################################################################

up: ## Start containers in daemon mode
	${DOCKER_COMPOSE} up -d db mqtt redis
.PHONY: up

clear: ## Clear all docker container
	${DOCKER_COMPOSE} down --volumes
.PHONY: up

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
.PHONY: help
