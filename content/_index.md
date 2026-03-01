---
title: "Workshop"
date: "`r Sys.Date()`"
weight: 1
chapter: false
---

# Serverless URL Shortener

Welcome to the Workshop. In this section, we will build a complete **URL Shortener** application using **Serverless** architecture on AWS.

The main goal is to get familiar with and combine core AWS services to solve real-world problems regarding cost optimization and scalability.

### AWS Services Used

This project will focus on the following services:

*   **AWS Lambda**: Serverless compute service running backend code (.NET 8) without managing servers.
*   **Amazon DynamoDB**: High-performance NoSQL database for storing user and link information.
*   **Amazon API Gateway**: RESTful API entry point, receiving requests from the Internet and forwarding them to Lambda.
*   **Amazon S3**: Static web hosting for Frontend (ReactJS).
*   **Amazon CloudFront**: CDN for global Frontend content delivery and API caching.
*   **AWS IAM**: Managing secure access permissions between services.

### System Architecture

![URL Shortener Platform Architecture](/images/2-Proposal/serverless_url_shortener_architecture.jpeg)

1.  **Frontend**: Users access the web interface hosted on S3 and distributed via CloudFront.
2.  **API**: Requests from the Frontend are sent to API Gateway.
3.  **Backend**: API Gateway triggers AWS Lambda to execute business logic.
4.  **Database**: Lambda interacts with DynamoDB to read/write data.

Let's get started!
