### command docker
```console
docker inspect containerid --format '{{ json .Config.Labels }}' | sed 's/,/\n/g'
  
docker exec --user www-data 533eac37ecb4 php occ config:system:get trusted_domains

docker exec --user www-data hit-nextcloud php occ config:system:set trusted_domains 1 --value=172.20.10.100:8080
    
```

### command docker-compose
```console
docker-compose down --rmi all --volumes
```