.PHONY: build up down test lint fmt

up:
	docker-compose up -d

down:
	docker-compose down

build:
	docker-compose build

test:
	pytest

lint:
	flake8 app/ app2/

fmt:
	black app/ app2/
