output "distribution_id" {
    value       = aws_cloudfront_distribution.this.id
    description = "The ID of the CloudFront distribution"
}

output "distribution_domain_name" {
    value       = aws_cloudfront_distribution.this.domain_name
    description = "The domain name of the CloudFront distribution"
}

output "oai_iam_arn" {
    value       = aws_cloudfront_origin_access_identity.this.iam_arn
    description = "The IAM ARN of the Origin Access Identity"
}
