#!/bin/bash
# Script deploy nextcloud with docker

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
hostnamectl set-hostname test

# config file host
cat >> "/etc/hosts" <<END
127.0.0.1 test test.hit.local
192.168.1.244 test test.hit.local
END

##########################################################################################
# SECTION 2: INSTALL 

# install docker

yum -y install yum-utils device-mapper-persistent-data lvm2
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
yum -y install docker-ce

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

#install vmware tools
yum -y install open-vm-tools

# install git
yum -y install git

# Deploy Portainer
# Create volume cho portainer
docker volume create portainer_data

# Create portainer container
docker run -d -p 9000:9000 --name=portainer --restart=always \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v portainer_data:/data \
  portainer/portainer  

#########################################################################################
# SECTION 3: FINISHED

# config firwall
systemctl start firewalld
systemctl enable firewalld
sudo firewall-cmd --zone=public --permanent --add-port=9000/tcp
sudo firewall-cmd --zone=public --permanent --add-port=80/tcp
sudo firewall-cmd --zone=public --permanent --add-port=443/tcp
sudo firewall-cmd --reload

# notification
echo "next deploy in file doc.md"
echo " Server restart 5s"
sleep 5
reboot