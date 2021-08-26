docker exec -it nextcloud-app /bin/bash
docker inspect 1ebe5b1784ad --format '{{ json .Config.Labels }}' | sed 's/,/\n/g'

docker-compose build --pull
docker-compose up -d



