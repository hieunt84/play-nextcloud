### Info setup
    admin/Happyit@2021$
    http://nextcloud.hit.test:8080/
### next
    config persistent volume.

### start nextcloud when restart server
    docker ps
    docker start container-id
    
### fix error unstruted domain
    docker exec --user www-data 533eac37ecb4 php occ config:system:get trusted_domains
    docker exec --user www-data 533eac37ecb4 php occ config:system:set trusted_domains 1 --value=172.20.10.100:8080