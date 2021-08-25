### Thông tin
- dùng image mariadb:lastest
- cấu hình tham số command: --innodb_read_only_compressed=OFF
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