---
title: "Cleanup Resources"
date: "`r Sys.Date()`"
weight: 5
chapter: false
pre: " <b> 5. </b> "
---

### Delete resources to avoid costs
After finishing the workshop, delete resources in the following order:
1.  **S3 Bucket**: Empty and delete the bucket.
2.  **CloudFront**: Disable and Delete distribution.
3.  **API Gateway**: Delete API.
4.  **Lambda Function**: Delete function.
5.  **DynamoDB Table**: Delete table.
