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

# Install Docker compose
sudo curl -sL "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

# Install git
# sudo yum -y install git

#########################################################################################
# SECTION 3: DEPLOY NEXTCLOUD

# clone source code from github
# cd ~
# git clone https://github.com/hieunt84/play-nextcloud-test2.git
# cd ./play-nextcloud-test2/proxy/version3

# Start docker-compose
# docker-compose pull
# docker-compose up -d
# curl -H "Host: nextcloud.local" localhost

#########################################################################################
# SECTION 4: FINISHED

# notification
echo " DEPLOY COMPLETELY"
