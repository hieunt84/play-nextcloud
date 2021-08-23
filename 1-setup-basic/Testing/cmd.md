### Commands
    docker ps -a
    docker start container-id
    docker exec -it 533eac37ecb4 /bin/bash
    docker exec --user www-data 533eac37ecb4 php occ
    docker exec --user www-data 533eac37ecb4 php occ config:system:get trusted_domains
    docker exec --user www-data 533eac37ecb4 php occ config:system:set trusted_domains 1 --value=172.20.10.100:8080
    docker exec --user www-data hit-nextcloud php occ config:system:set trusted_domains 1 --value=172.20.10.100:8080

    docker-compose rm