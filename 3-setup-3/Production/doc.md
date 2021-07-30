### Prepare
  VM on VMware
    CPU:1
    RAM:1GB
    HDD:10GB
    OS:Centos7-64bit
  Bootstrap:bootstrap.sh

### Deploy
    Step 1: depoloy nextcloud
      -using portainer
      -using docker-compose.yml
    Step 2: 
      config nginx-proxy-manager rule for nextcloud
    Step 3:
      finish

### Info setup
    local:
      http://docker1.hit.local:8080/
      
    Internet:
      http://nextcloud.hit.vn/ (public domain)