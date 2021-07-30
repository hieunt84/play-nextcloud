## setup basic
  using docker run

### Prepare
  VM on VirtualBox
    CPU:1
    RAM:1GB
    HDD:10GB
    OS:Centos7-64bit
  Bootstrap:bootstrap.sh

### Deploy continue
    Step 1: 
      access http://ip-private:6060
      setup init
    Step 2:
      docker exec --user www-data nextcloud php occ config:system:set trusted_domains 1 --value=ip-public:6060
    Step 3:
      finish

### Info setup    
    local:
      http://nextcloud.hit.local:6060/
    internet:
      http://xxx:6060/ 
    
### fix error unstruted domain
    docker exec --user www-data 533eac37ecb4 php occ config:system:get trusted_domains
    docker exec --user www-data 533eac37ecb4 php occ config:system:set trusted_domains 1 --value=172.20.10.100:6060