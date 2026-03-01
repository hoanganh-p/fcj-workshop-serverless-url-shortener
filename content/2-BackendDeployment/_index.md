---
title: "Backend Deployment"
date: "`r Sys.Date()`"
weight: 2
chapter: false
pre: " <b> 2. </b> "
---

### 1. Create DynamoDB Table
*   Table Name: `Url`.
*   Partition Key: `shortcode` (String).
![URL Table Creation](/images/5-Workshop/5.2-BackendDeployment/url-table.png)

### 2. Deploy AWS Lambda
Use `dotnet lambda deploy-function` to upload your .NET code.
*   Runtime: .NET 8
*   Handler: `UrlShortener.Api`
![Lambda Deployment Success](/images/5-Workshop/5.2-BackendDeployment/lambda-function.png)

### 3. Configure API Gateway
*   Create a new REST API.
*   Manually create Resources and Methods structure (integrate Lambda):
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
*   **Enable CORS (Important)**:
    *   Select root Resource `/` -> Actions -> **Enable CORS**.
    *   Ensure the CORS policy allows the CloudFront domain (obtained in step 5.3).
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
*   **Deploy API** to `prod` stage.
![Deploy API to prod](/images/5-Workshop/5.2-BackendDeployment/deploy-api.png)
