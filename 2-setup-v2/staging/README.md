### Prepare
  1.VM on VMware
    CPU:1
    RAM:2GB
    HDD:16GB
    OS:Centos7-64bit

  2.script:bootstrap.sh
  3.Khai báo sub domain
  4.Mở cổng 80/443/9000

### Deploy
    1.Step 1: depoloy nextcloud
      -using portainer
      -using repo github      

    2.Step 2: Access
      local:
        http://docker1.hit.local:8080/
      
      Internet:
        http://nextcloud.hit.vn/ (public domain)

    3. Step 3: Setup admin nextcloud
    4. Fix error : nextcloud polling url do not start with https

### cập nhật ngày 26Aug2021
- Bổ sung service cron trong file docker-compose







      