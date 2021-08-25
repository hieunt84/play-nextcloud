### Command docker
docker exec -it nextcloud-app /bin/ash

### Command Firewall cmd
1.add port
sudo firewall-cmd --zone=public --permanent --add-port=9000/tcp
firewall-cmd --reload
systemctl restart firewalld
firewall-cmd --zone=public --list-ports

2. Remove port, Follow these steps, you will be fine:
$ firewall-cmd --zone=public --remove-port=2357/tcp
$ firewall-cmd --reload
$ systemctl restart firewalld
$ firewall-cmd --zone=public --list-ports