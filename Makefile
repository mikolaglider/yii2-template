up:
	docker-compose up -d

down:
	docker-compose down

init: up
	docker-compose run --rm php-fpm composer install
	docker-compose run --rm php-fpm php /app/init
	docker-compose run --rm php-fpm yii migrate/up --interactive 0

restart: up down

cli: up
	docker-compose exec	php-fpm bash

db: up
	docker-compose exec	mysql bash

test:
	docker-compose run --rm php-fpm vendor/bin/codecept run