default: run

#### Setup Commands

setup:
	docker-compose run --rm --service-ports rails sh -c "bin/setup setup"

bundle.install:
	docker-compose run --rm -T --no-deps rails sh -c "bundle install"

#### CI/CD Commands

ci:
	docker-compose run --rm rails sh -c "bin/ci"

check.format:
	docker-compose run --rm -T --no-deps rails sh -c "bundle exec standardrb"

#### Development Commands

run:
	docker-compose run --rm --service-ports rails sh -c "bin/run"

shell:
	docker-compose run --rm rails bash

console:
	docker-compose run --rm rails sh -c "rails c"



.PHONY: ci
