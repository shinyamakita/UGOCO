module "s3_bucket" {
    source = "terraform-aws-modules/s3-bucket/aws"
    version = "3.15.1

    bucket = "${var.service_name}-${var.environment}-static-site"

    block_public_acls       = true
    block_public_policy     = true
    ignore_public_acls      = true
    restrict_public_buckets = true

    versioning = {
        enabled = var.enable_versioning
    }

    server_side_encryption_configuration = {
        rule = {
            apply_server_side_encryption_by_default = {
                sse_algorithm = "AES256"
            }
        }
    }

    attach_policy = true
    policy = jsonencode({
        Version = "2012-10-17"
        Statement = [
            {
                Sid = "AllowCloudFrontAccess"
                Effect = "Allow"
                Principal = {
                    AWS = var.cloudfront_oai_iam_arn
                }
                Action = "s3:GetObject"
                Resource = "${module.s3_bucket.s3_bucket_arn}/*"
            }
        ]
    })
}

