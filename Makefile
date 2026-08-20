.PHONY: build run test clean help

IMAGE ?= quarto
REGISTRY := ghcr.io/edgar-treischl

help:
	@echo "Usage:"
	@echo "  make build [IMAGE=quarto]   Build Docker image"
	@echo "  make run [IMAGE=quarto]     Run container"
	@echo "  make test [IMAGE=quarto]    Test container"
	@echo "  make clean [IMAGE=quarto]   Remove image"
	@echo ""

build:
	docker build -f images/$(IMAGE)/Dockerfile -t $(REGISTRY)/$(IMAGE):latest ./images/$(IMAGE)

run:
	docker run --rm -it $(REGISTRY)/$(IMAGE):latest bash

test:
	docker run --rm $(REGISTRY)/$(IMAGE):latest set -eux; which quarto; which R

clean:
	docker rmi -f $(REGISTRY)/$(IMAGE):latest
