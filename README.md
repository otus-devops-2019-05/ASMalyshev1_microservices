# ASMalyshev1_microservices
ASMalyshev1 microservices repository

#Homework #15 ("docker-2") В рамках текущего ДЗ сделано:

	1. Произвели установку docker и docker-machine
	2. Создали новый проект в В GCP
	3. Создали контейнер с приложением в GCP 
	4. Сделали образ контейнера и запушили его в https://hub.docker.com/

#Homework #16 ("docker-3") В рамках текущего ДЗ сделано:

	1. Выполняем сборку контейнера
		docker build -t reddit:latest .
	2. Запускаем контейнер
		docker run --name reddit -d --network=host reddit:latest
