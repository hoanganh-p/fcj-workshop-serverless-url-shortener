---
title: "Frontend Deployment"
date: "`r Sys.Date()`"
weight: 3
chapter: false
pre: " <b> 3. </b> "
---

### 1. Create S3 Bucket
*   Create a new bucket (e.g., `urlshortener-frontend-bucket`).
*   Enable **Static website hosting**.
![S3 Bucket](/images/5-Workshop/5.3-FrontendDeployment/s3-buckets.png)

### 2. Configure CloudFront
*   Create a Distribution pointing to S3 (Frontend) and API Gateway (Backend).
*   Set **Origin Path** `/prod` for API Gateway origin.
*   Set **Redirect HTTP to HTTPS**.
![Frontend CloudFront](/images/5-Workshop/5.3-FrontendDeployment/frontend-cloudfront.png)
![Backend CloudFront](/images/5-Workshop/5.3-FrontendDeployment/backend-cloudfront.png)

### 3. Build & Upload React App
*   Update `API_URL` in React code to use CloudFront domain.
    ```js
    const AWS_API_URL = 'https://d2s5r61an6mtu1.cloudfront.net';
    ``` 
*   Build the project:
    ```bash
    npm run build
    ```
*   Upload the `build` folder content to S3 Bucket.
![Upload file to S3](/images/5-Workshop/5.3-FrontendDeployment/upload-to-s3.png)
