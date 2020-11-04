start:
	docker-compose up

stop:
	docker-compose stop

delete:
	docker-compose down

re-init:
	docker-compose down
	docker rmi app_camunda:latest
	docker-compose up