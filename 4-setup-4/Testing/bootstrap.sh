#!/bin/bash
# Script deploy nextcloud with docker

##########################################################################################
# SECTION 1: PREPARE

# change root
sudo -i
sleep 2

# update system
# yum clean all
# yum -y update
# sleep 1

# config timezone
timedatectl set-timezone Asia/Ho_Chi_Minh

# disable SELINUX
setenforce 0 
sed -i 's/enforcing/disabled/g' /etc/selinux/config

# disable firewall
systemctl stop firewalld
systemctl disable firewalld

# config hostname
hostnamectl set-hostname docker1

# config file host
cat >> "/etc/hosts" <<END
127.0.0.1 docker1 docker1.hit.local
172.20.10.10 docker1 docker1.hit.local
END

##########################################################################################
# SECTION 2: INSTALL 

# install docker

yum install -y yum-utils device-mapper-persistent-data lvm2
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
yum install -y docker-ce

# create servie docker
mkdir /etc/docker
cat > /etc/docker/daemon.json <<EOF
{
 "exec-opts": ["native.cgroupdriver=systemd"],
 "log-driver": "json-file",
 "log-opts": {
 "max-size": "100m"
 },
 "storage-driver": "overlay2",
 "storage-opts": [
   "overlay2.override_kernel_check=true"
 ]
}
EOF
mkdir -p /etc/systemd/system/docker.service.d

systemctl daemon-reload
systemctl restart docker
systemctl enable docker

# Deploy Portainer
# Create volume cho portainer
docker volume create portainer_data

# Create portainer container
docker run -d -p 9000:9000 --name=portainer --restart=always \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v portainer_data:/data \
  portainer/portainer

### Install Docker compose
sudo curl -sL "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

#########################################################################################
# SECTION 3: DEPLOY NEXTCLOUD

# create docker-compose to depoly nextcloud
cd ~
cat >> "./docker-compose.yml" <<EOL
version: '2'

volumes:
  nextcloud:
  dbnextcloud:

services:
  db:
    image: mariadb
    restart: always
    command: 
      - --transaction-isolation=READ-COMMITTED
      - --binlog-format=ROW
      - --innodb_read_only_compressed=OFF
    volumes:
      - dbnextcloud:/var/lib/mysql
    environment:
      - MYSQL_ROOT_PASSWORD=abcqwe123@
      - MYSQL_PASSWORD=abcqwe123@
      - MYSQL_DATABASE=nextcloud
      - MYSQL_USER=nextcloud
  
  redis:
    image: redis:alpine
    restart: always

  app:
    image: nextcloud
    restart: always
    ports:
      - 8080:80
    links:
      - db
    volumes:
      - nextcloud:/var/www/html
    environment:
      - MYSQL_PASSWORD=abcqwe123@
      - MYSQL_DATABASE=nextcloud
      - MYSQL_USER=nextcloud
      - MYSQL_HOST=db
      - REDIS_HOST=redis
EOL

# Start docker-compose
docker-compose pull
docker-compose up -d

#########################################################################################
# SECTION 4: FINISHED

# config firwall
systemctl start firewalld
systemctl enable firewalld
sudo firewall-cmd --zone=public --permanent --add-port=8080/tcp
sudo firewall-cmd --zone=public --permanent --add-port=9000/tcp
sudo firewall-cmd --reload

# notification
echo " DEPLOY COMPLETELY"
# echo "next deploy in file doc.md"
# echo " Server restart 5s"
# sleep 5
# reboot