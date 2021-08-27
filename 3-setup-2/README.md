### Thông tin
1. triển khai bằng docker-compose
2. dùng image mariadb:lastest làm database
3. cấu hình tham số command: --innodb_read_only_compressed=OFF
    `services:
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
          - MYSQL_ROOT_PASSWORD=
          - MYSQL_PASSWORD=
          - MYSQL_DATABASE=nextcloud
          - MYSQL_USER=nextcloud`