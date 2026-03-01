---
title: "Triển khai Frontend"
date: "`r Sys.Date()`"
weight: 3
chapter: false
pre: " <b> 3. </b> "
---

### 1. Tạo S3 Bucket
*   Tạo bucket mới (ví dụ: `urlshortener-frontend-bucket`).
*   Bật tính năng **Static website hosting**.
![S3 Bucket](/images/5-Workshop/5.3-FrontendDeployment/s3-buckets.png)

### 2. Cấu hình CloudFront
*   Tạo Distribution trỏ tới S3 Bucket (Frontend) và API Gateway (Backend).
*   Cấu hình **Origin Path** `/prod` cho API Gateway.
*   Thiết lập **Redirect HTTP to HTTPS**.
![Frontend CloudFront](/images/5-Workshop/5.3-FrontendDeployment/frontend-cloudfront.png)
![Backend CloudFront](/images/5-Workshop/5.3-FrontendDeployment/backend-cloudfront.png)

### 3. Build & Upload React App
*   Cập nhật `API_URL` trong code React trỏ về domain CloudFront.
    ```js
    const AWS_API_URL = 'https://d2s5r61an6mtu1.cloudfront.net';
    ``` 
*   Chạy lệnh build:
    ```bash
    npm run build
    ```
*   Upload toàn bộ thư mục `build` lên S3 Bucket.
![Upload file to S3](/images/5-Workshop/5.3-FrontendDeployment/upload-to-s3.png)
