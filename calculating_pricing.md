# 料金比較 (USD/month)
## Case 1
cloudfront - s3 - api gateway - lambda - dynamoDB構成

| Resource    | Price | note  |
|-------------|-------|-------|
| Cloudfront  | $1.86  | 10GB Data transfer out to internet and Origin, 100,000 requests |
| S3          | $1.62  | 50GB stored data and 1M GET |
| api gateway | $1.29  | 1M requiest with 34KB |
| lambda      | $1.67  | 1GB memory and 0.5GB ephemeral storage, 0.1s/request with 1M requests |
| DynamoDB    | $6.48  | on-demand capacity, 20GB with 1KB item size, no Strongly consistent |
合計：12.92 USD
