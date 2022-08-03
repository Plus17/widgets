default: run

#### Setup Commands

setup:
	docker-compose run --rm --service-ports rails sh -c "bin/setup setup"

#### CI/CD Commands

ci:
	docker-compose run --rm rails sh -c "bin/ci"

#### Development Commands

run:
	docker-compose run --rm --service-ports rails sh -c "bin/run"

shell:
	docker-compose run --rm rails bash

console:
	docker-compose run --rm rails sh -c "rails c"



.PHONY: ci
