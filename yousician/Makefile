prepare_mongo:
	docker run --detach --name songs_db --publish 127.0.0.1:27017:27017 mongo:4.4
	docker exec -i songs_db sh -c 'mongoimport -c songs -d main --drop' < songs.json
	docker exec -i songs_db mongo main --eval 'db.songs.createIndex({"artist": "text", "title": "text"})'

start_mongo:
	docker start songs_db

run:
	flask run

test:
	pytest
