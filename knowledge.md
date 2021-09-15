### https
1. ssl/tls:
- là giao thức hoạt động ở tầng 4 của mô hình TCP/IP.
- dùng để mã hóa thông tin.
- kết hợp với http để tăng cường an toàn thông tin cho website.

2. https = http + ssl/tls(nâng cấp ssl)

3. Để triển khai https cho website:
  - Chúng cần chứng chỉ ssl (certificate) cho website, tên miền
  - Chứng chỉ SSL được cấp bởi CA (Let's Encrypt, Glabal Sign )
  - Sau khi có chứng chỉ ssl, ta cấu hình website sử dụng ssl.
  - cấu hình website/app tùy vào ứng dụng mà có cách cấu hình cụ thể

### Let's Encrypt
1. Let's Encrypt cấp SSL miễn phí
2. Triển khai lại ứng dụng có cấp được SSL ?
   - không.
   - phải sao lưu ssl.
   - ssl gồm hai tập tin:
     hit.com.crt
     hit.com.key

3. Kiểm tra acc Let's Encrypt đã tạo cho bao nhiêu domain
  - sử dụng tool sau : https://crt.sh/

4. Cấp ssl cho toàn bộ tên miền để tiết kiệm
  *.hit.com thay vì cấp cho tên miền con (sub domain : test.hit.com)

5. dùng môi trường stagging cho mục đích thử nghiệm
   - để tránh chạm tới giới hạn

### Ref
https://vietnix.vn/ssl-la-gi/

### Docker
1. Instruction LABEL
- You can use labels to organize your images, record licensing information, annotate relationships between containers, volumes, and networks, or in any way that makes sense for your business or application.
- Ref: https://www.shellhacks.com/docker-label-image-build-dockerfile-example/

2. Instruction ENTRYPOINT
- Ref: https://www.bmc.com/blogs/docker-cmd-vs-entrypoint/

