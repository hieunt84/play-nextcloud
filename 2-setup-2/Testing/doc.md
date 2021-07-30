## setup 2
  using docker-compose

### fix error unstruted domain
    docker-compose exec --user www-data 533eac37ecb4 php occ config:system:get trusted_domains
    docker-compose exec --user www-data 533eac37ecb4 php occ config:system:set trusted_domains 1 --value=172.20.10.100:6060