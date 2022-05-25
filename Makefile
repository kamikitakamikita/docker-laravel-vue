# 初期化（リポジトリをクローン後、最初に実行する）
init:
	docker-compose up -d --build
	docker-compose exec app composer install
	docker-compose exec app cp .env.example .env
	docker-compose exec app php artisan key:generate
	docker-compose exec app php artisan storage:link
	docker-compose exec app chmod -R 777 storage bootstrap/cache
	@make fresh
	@make npm-install
	@make npm-dev
fresh:
	docker compose exec app php artisan migrate:fresh --seed
npm-install:
	docker-compose exec app npm install
npm-dev:
	docker-compose exec app npm run dev