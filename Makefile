SHELL=/bin/bash
UP_WAIT := grep -q 'yarn finished' <(docker-compose logs -f app)


up:
	docker-compose up -d
	$(UP_WAIT)
down:
	docker-compose down
test:
	docker-compose exec -T app yarn test
shell:
	docker-compose exec app sh


.PHONY: up down test shell
