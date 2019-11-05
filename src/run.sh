docker network create reddit

docker run -d --network=reddit --network-alias=post_db_env \
--network-alias=comment_db_env -v reddit_db:/data/db mongo:latest

docker run -d --network=reddit --network-alias=post_env  \
-e POST_DATABASE_HOST=post_db_env \
igataullin/post:1.0

docker run -d --network=reddit --network-alias=comment_env  \
-e COMMENT_DATABASE_HOST=comment_db_env \
igataullin/comment:1.0

docker run -d --network=reddit  \
-e POST_SERVICE_HOST=post_env \
-e COMMENT_SERVICE_HOST=comment_env \
-p 9292:9292 \
igataullin/ui:2.0
