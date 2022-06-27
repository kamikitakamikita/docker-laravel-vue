# 初期化（リポジトリをクローン後、最初に実行する）
init:
	docker compose up -d --build
	docker compose exec app composer install
	docker compose exec app cp .env.example .env
	docker compose exec app php artisan key:generate
	docker compose exec app php artisan storage:link
	docker compose exec app chmod -R 777 storage bootstrap/cache
	@make fresh
	@make npm-install
	@make npm-dev

# docker操作
up:
	docker compose up -d

down:
	docker compose down

web:
	docker-compose exec web sh

app:
	docker-compose exec app bash

db:
	docker-compose exec db bash

# laravel
fresh:
	docker compose exec app php artisan migrate:fresh --seed

tinker:
	docker-compose exec app php artisan tinker

# npm
npm-install:
	docker compose exec app npm install

npm-dev:
	docker compose exec app npm run dev

npm-watch:
	docker compose exec app npm run watch

npm-poll:
	docker compose exec app npm run watch-poll

npm-lint-dry:
	docker compose exec app npm run lint-dry

npm-lint-fix:
	docker compose exec app npm run lint-fix