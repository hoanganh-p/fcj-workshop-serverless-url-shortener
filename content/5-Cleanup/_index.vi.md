---
title: "Dọn dẹp tài nguyên"
date: "`r Sys.Date()`"
weight: 5
chapter: false
pre: " <b> 5. </b> "
---

### Xóa tài nguyên để tránh phát sinh chi phí
Sau khi hoàn thành workshop, hãy xóa các tài nguyên theo thứ tự:
1.  **S3 Bucket**: Xóa hết object bên trong rồi xóa bucket.
2.  **CloudFront**: Disable và Delete distribution.
3.  **API Gateway**: Delete API.
4.  **Lambda Function**: Delete function.
5.  **DynamoDB Table**: Delete table.
