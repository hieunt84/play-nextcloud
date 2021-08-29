#!/bin/bash
# Script deploy NEXTCLOUD with docker

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
# hostnamectl set-hostname docker1

# config file host
# cat >> "/etc/hosts" <<END
# 127.0.0.1 docker1 docker1.hit.local
# 172.20.10.110 docker1 docker1.hit.local
# END

##########################################################################################
# SECTION 2: INSTALL Docker, Docker-compse, Portainer, git

# Install docker
curl -fsSL https://get.docker.com/ | sh
systemctl start docker
systemctl enable docker

# Install docker-compose
sudo curl -sL "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

# install git
yum -y install git

#########################################################################################
# SECTION 3: DEPLOY NEXTCLOUD

# clone repo from github
cd ~
git clone https://github.com/hieunt84/play-nextcloud.git

# change working directory
cd ./play-nextcloud/testing/testing

# Make folder store data for portainer
mkdir -p ./data/portainer

# Make folder store data for mariadb
mkdir -p ./data/mariadb

# Make folder store data redis
mkdir -p ./data/redis

# Make folder store data for nextcloud
mkdir -p ./data/nextcloud

# deploy nextcloud
docker-compose up -d

# verify
docker-compose ps

#########################################################################################
# SECTION 4: FINISHED

# config firwall
systemctl start firewalld
systemctl enable firewalld
sudo firewall-cmd --zone=public --permanent --add-port=8080/tcp
sudo firewall-cmd --zone=public --permanent --add-port=2375/tcp
sudo firewall-cmd --reload
sudo systemctl restart firewalld

# notification
echo " DEPLOY COMPLETELY"