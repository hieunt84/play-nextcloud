#!/bin/bash

##########################################################################################
# SECTION 1: PREPARE

# update system
sudo -i
sleep 2
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
# hostnamectl set-hostname node2

# config file host
# cat >> "/etc/hosts" <<END
# 172.16.10.100 node1
# 172.16.10.101 node2
# 172.16.10.102 node3 
# END

# config network, config in vagrantfile in dev

# Tắt swap: Nên tắt swap để kubelet hoạt động ổn định.
# sed -i '/swap/d' /etc/fstab
# swapoff -a

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

# install
docker run -d \
--name hit-nextcloud \
-v hit-nextcloud:/var/www/html \
-p 8080:80 \
nextcloud

#########################################################################################
# SECTION 4: FINISHED

echo "installation nextcloud completely"
