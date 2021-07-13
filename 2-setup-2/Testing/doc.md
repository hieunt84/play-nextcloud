### Info setup
    using docker-compose
    admin/abc123!@#
    http://nextcloud.hit.test:8080/

### fix error unstruted domain
    docker-compose exec --user www-data 533eac37ecb4 php occ config:system:get trusted_domains
    docker-compose exec --user www-data 533eac37ecb4 php occ config:system:set trusted_domains 1 --value=172.20.10.100:8080