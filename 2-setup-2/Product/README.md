### Prepare
  1.VM on VMware
    CPU:1
    RAM:2GB
    HDD:16GB
    OS:Centos7-64bit

  2.script:bootstrap.sh
  3.Khai báo sub domain on yourDNS (Mắt Bảo)
  4.Mở cổng 80/443 trên router (draytek)(nếu cần)
  5.Cấu hình mở port 2375 cho docker để Portainer kết nối

### Deploy
    1.Step 1: deploy nextcloud
      -use portainer
      -use repo github

    2.Config https on Proxy-Nginx-Manager   

    3.Step 2: Access
      local:
        https://docker-product01.hit.local:8080/
      
      Internet:
        https://nextcloud.hit.com/ (public domain)

    3. Step 3: Setup admin nextcloud
    4. Fix error : nextcloud polling url do not start with https

### Ref
https://github.com/nginx-proxy/acme-companion

### Sửa chữa lỗi liên quan đến cho phép truy cập (grant access) của destop client ### liên quan đến giao thức https
Error: nextcloud polling url do not start with https
Solution: https://github.com/nextcloud/desktop/issues/1521









      