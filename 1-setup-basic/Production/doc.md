### Prepare
  VM on VMware
    CPU:1
    RAM:1GB
    HDD:10GB
    OS:Centos7-64bit
  Bootstrap:bootstrap.sh

### Deploy continue
    Step 1: depoly nextcloud
      -using portainer
      -using docker-compose.yml
    Step 2: 
      access http://ip-private:8080
      setup init
    Step 3:
      docker exec --user www-data hit-nextcloud php occ config:system:set trusted_domains 1 --value=ip-public:8080
    Step 4:
      finish

### Info setup    
    local:
      http://nextcloud.hit.local:8080/
    internet:
      http://xxx:8080/
    acc admin:
      xxx
      
### start nextcloud when restart server
    docker ps -a
    docker start container-id
    
### fix error unstruted domain
    Note: phải run init setup từ môi trường local rồi mới chạy được lệnh này.
    docker exec --user www-data hit-nextcloud php occ config:system:get trusted_domains
    docker exec --user www-data hit-cloud php occ config:system:set trusted_domains 1 --value=ip-public:8080
