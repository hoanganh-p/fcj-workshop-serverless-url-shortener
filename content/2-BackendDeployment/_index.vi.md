---
title: "Triển khai Backend"
date: "`r Sys.Date()`"
weight: 2
chapter: false
pre: " <b> 2. </b> "
---

### 1. Tạo DynamoDB Table
*   Tạo bảng tên `Url`.
*   Partition Key: `shortcode` (String).
![URL Table Creation](/images/5-Workshop/5.2-BackendDeployment/url-table.png)

### 2. Deploy AWS Lambda
Sử dụng lệnh `dotnet lambda deploy-function` để đẩy code .NET lên AWS Lambda.
*   Runtime: .NET 8
*   Handler: `UrlShortener.Api`
![Lambda Deployment Success](/images/5-Workshop/5.2-BackendDeployment/lambda-function.png)

### 3. Cấu hình API Gateway
*   Tạo REST API mới.
*   Tạo cấu trúc Resource và Method thủ công (tích hợp Lambda cho các method chính):
    *   /{shortCode}: GET, OPTIONS
    *   /api/auth:
        *   /login: POST, OPTIONS
        *   /register: POST, OPTIONS
    *   /api/url`:
        *   /create: POST, OPTIONS
        *   /{code}: GET, DELETE, OPTIONS
    *   /api/user:
        *   /all: GET, OPTIONS

    ![API Gateway Configuration](/images/5-Workshop/5.2-BackendDeployment/api-resources.png)
*   **Bật CORS (Quan trọng)**:
    *   Chọn Resource gốc `/` -> Actions -> **Enable CORS**.
    *   Đảm bảo đã thêm policy cho phép domain của CloudFront (sẽ có ở bước 5.3).
    ``` C#
    builder.Services.AddCors(options =>
    {
        options.AddPolicy("AllowCors",
            policy =>
            {
                policy.WithOrigins("https://d2wnt86s7rdbuv.cloudfront.net")
                        .AllowAnyHeader()
                        .AllowAnyMethod();
            });
    });
    ```
*   **Deploy API** sang stage `prod`.
![Deploy API to prod](/images/5-Workshop/5.2-BackendDeployment/deploy-api.png)
