include .env
export $(shell sed 's/=.*//' .env)

container_prefix ?= zz_ # so if one's not passed in, we set something.


.PHONY: build tag push login all

build:
	docker build -t $(IMAGE_NAME) .

tag:
	docker tag $(IMAGE_NAME) $(ECR_REGISTRY_ID).dkr.ecr.$(AWS_REGION).amazonaws.com/$(IMAGE_NAME):$(VERSION)

run-terraform-validate:
	docker-compose -p ${container_prefix} -f docker-compose.yaml run --rm run-terraform-validate
	
push:
	docker push $(ECR_REGISTRY_ID).dkr.ecr.$(AWS_REGION).amazonaws.com/$(IMAGE_NAME):$(VERSION)

run:
	docker run -i -t $(IMAGE_NAME) /bin/bash
