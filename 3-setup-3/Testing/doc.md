### fix error unstruted domain (nếu có)
```console
docker-compose exec --user www-data containerid php occ config:system:get trusted_domains
docker-compose exec --user www-data containerid php occ config:system:set trusted_domains 1 --value=172.20.10.110:8080
```