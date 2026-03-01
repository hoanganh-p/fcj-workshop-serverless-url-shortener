---
title: "Workshop"
date: "`r Sys.Date()`"
weight: 1
chapter: false
---

# Serverless URL Shortener

Chào mừng bạn đến với bài thực hành (Workshop). Trong phần này, chúng ta sẽ xây dựng một ứng dụng **URL Shortener** hoàn chỉnh sử dụng kiến trúc **Serverless** trên AWS.

Mục tiêu chính là làm quen và kết hợp các dịch vụ AWS cốt lõi để giải quyết bài toán thực tế về tối ưu chi phí và khả năng mở rộng.

### Các dịch vụ AWS sử dụng

Dự án này sẽ tập trung vào các dịch vụ sau:

*   **AWS Lambda**: Dịch vụ tính toán serverless, chạy code backend (.NET 8) mà không cần quản lý máy chủ.
*   **Amazon DynamoDB**: Cơ sở dữ liệu NoSQL hiệu năng cao để lưu trữ thông tin người dùng và liên kết.
*   **Amazon API Gateway**: Cổng giao tiếp RESTful API, tiếp nhận request từ Internet và chuyển tiếp vào Lambda.
*   **Amazon S3**: Lưu trữ static web hosting cho Frontend (ReactJS).
*   **Amazon CloudFront**: CDN giúp phân phối nội dung Frontend toàn cầu và caching cho API.
*   **AWS IAM**: Quản lý quyền truy cập bảo mật giữa các dịch vụ.

### Kiến trúc hệ thống

![URL Shortener Platform Architecture](/images/2-Proposal/serverless_url_shortener_architecture.jpeg)

1.  **Frontend**: Người dùng truy cập giao diện web được lưu trữ trên S3 và phân phối qua CloudFront.
2.  **API**: Các yêu cầu từ Frontend được gửi đến API Gateway.
3.  **Backend**: API Gateway kích hoạt AWS Lambda để xử lý logic nghiệp vụ.
4.  **Database**: Lambda tương tác với DynamoDB để đọc/ghi dữ liệu.

Hãy cùng bắt tay vào triển khai!
