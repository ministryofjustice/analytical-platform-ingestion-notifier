.PHONY: build debug

IMAGE_NAME ?= analytical-platform.service.justice.gov.uk/ingestion-notify
IMAGE_TAG  ?= local

build:
	docker build --platform linux/amd64 --file Dockerfile --tag $(IMAGE_NAME):$(IMAGE_TAG) .

debug: build
	docker run -it --rm \
		--platform linux/amd64 \
		--hostname ingestion-notify \
		--name analytical-platform-ingestion-notify \
		--entrypoint /bin/bash \
		$(IMAGE_NAME):$(IMAGE_TAG)
