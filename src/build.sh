docker pull mongo:latest
docker build -t igataullin/post:1.0 ./post-py
docker build -t igataullin/comment:1.0 ./comment
docker build -t igataullin/ui:1.0 ./ui
