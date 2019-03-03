DOCKER_IMAGE := nginx:1.15.9-alpine
DOCKER_CONTAINER_NAME := website-nginx

.PHONY: local
local:
	@docker stop $(DOCKER_CONTAINER_NAME) > /dev/null 2>&1 || true
	@docker rm $(DOCKER_CONTAINER_NAME) > /dev/null 2>&1  || true
	docker run \
		--name $(DOCKER_CONTAINER_NAME) \
		-d \
		-p 8080:80 \
		-v $$(PWD):/usr/share/nginx/html:ro \
		$(DOCKER_IMAGE)
