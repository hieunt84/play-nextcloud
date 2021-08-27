# play-nextcloud
### Giới thiệu
- Cung cấp giải pháp lưu trữ đám mây cho cá nhân và doanh nghiệp
  + giống với Google Drive, OneDrive,...
- Cung cấp giải pháp không gian làm việc cộng tác
  + Giống với Google Workspace
- Tham khảo chi tiết hơn:
  + https://vietnix.vn/nextcloud-la-gi/

### Có hai cách triển khai
1. Triển khai cách 1:
- Đứng sau Reverse Proxy.
- ví dụ: version 2
2. Triển khai cách 2:
- Trong quá trình khiển khai có luôn proxy và mã hóa ssl
- ví dụ: version 5

### Công cụ sử dụng trong dự án:
1. Portainer: quản lý docker host qua giao diện web
2. Nginx-proxy-manager: cung cấp reverse proxy và chứng chỉ ssl Let's Encrypt
3. https://app.diagrams.net/: dùng để vẽ sơ đồ kiến trúc dự án
4. https://ping.eu/: dùng để kiểm tra mở port

### Công nghệ sử dụng trong dự án:
1. Docker: công nghệ mới dùng để triển khai dự án một cách nhanh chóng.
2. Nginx: cung cấp giải pháp reverse proxy
3. Let's Encrypt: cung cấp giải pháp mã hóa ssl
5. Redis: cung cấp giải pháp caching cho ứng dụng web nextcloud.
6. LAMP-stack: nền tảng để chạy ứng dụng.
- Linux: cung cấp hệ điều hành mã nguồn mở
- Apache: cung cấp web server
- Mariadb: cung cấp giải pháp cơ sở dữ liệu
- Php : xử lý code bằng ngôn ngữ php.

### Ref    
- https://hub.docker.com/_/nextcloud    
- https://blog.cloud365.vn/nextcloud/nextcloud-p1-cai-dat-tren-centos7/
