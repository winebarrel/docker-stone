.PHONY: build
build:
	docker build -t public.ecr.aws/o0p0b7e7/stone:latest .

push:
	docker push public.ecr.aws/o0p0b7e7/stone:latest

