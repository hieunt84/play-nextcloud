### command docker
```console
docker network ls
docker network inspect [network_id/network_name]
docker exec -it [containerid] bash
docker inspect containerid --format '{{ json .Config.Labels }}' | sed 's/,/\n/g'
```

### command docker-compose
```console
docker-compose build --pull
docker-compose up -d
```