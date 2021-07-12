#!/bin/bash

##########################################################################################
# SECTION 1: PREPARE

# update system
yum clean all
yum -y update
sleep 1

# config timezone
timedatectl set-timezone Asia/Ho_Chi_Minh

# disable SELINUX
setenforce 0 
sed -i 's/enforcing/disabled/g' /etc/selinux/config

# disable firewall
systemctl stop firewalld
systemctl disable firewalld

# config hostname
hostnamectl set-hostname nextcloud.hit.local

# config file host
cat >> "/etc/hosts" <<END
127.0.0.1 nextcloud nextcloud.hit.local
END

##########################################################################################
# SECTION 2: INSTALL 

# install docker

yum install -y yum-utils device-mapper-persistent-data lvm2
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
yum install -y docker-ce
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

#########################################################################################
# SECTION 3: INSTALL NEXTCLOUD

docker run -d \
--name hit-nextcloud \
-v hit-nextcloud:/var/www/html \
-p 8080:80 \
nextcloud

#########################################################################################
# SECTION 4: FINISHED

# enable firwall
systemctl start firewalld
systemctl enable firewalld
sudo firewall-cmd --zone=public --permanent --add-port=8080/tcp
sudo firewall-cmd --reload

# notification
echo "next deploy in file doc.md"
