# 初期化（リポジトリをクローン後、最初に実行する）
init:
	docker-compose up -d --build
	docker-compose exec app composer install
	docker-compose exec app cp .env.example .env
	docker-compose exec app php artisan key:generate
	docker-compose exec app php artisan storage:link
	docker-compose exec app chmod -R 777 storage bootstrap/cache
	@make fresh
fresh:
	docker compose exec app php artisan migrate:fresh --seed