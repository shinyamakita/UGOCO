resource "aws_cloudfront_origin_access_identity" "this" {
    comment = "OAI for ${var.service_name}"
}

resource "aws_cloudfront_distribution" "this" {
    enabled             = true
    is_ipv6_enabled     = true
    default_root_object = "index.html"
    prise_class         = var.price_class

    origin {
        domain_name = var.s3_bucket_domain_name
        origin_id   = "S3Origin"

        s3_origin_config {
            origin_access_identity = aws_cloudfront_origin_access_identity.this.cloudfront_access_identity_path
        }
    }

    default_cache_behavior {
        allowed_methods        = ["GET", "HEAD"]
        cached_methods         = ["GET", "HEAD"]
        target_origin_id       = "S3Origin"
        viewer_protocol_policy = "redirect-to-https"
        compress               = true

        forwarded_values {
            query_string = false
            cookies {
                forward = "none"
            }
        }

        min_ttl     = var.min_ttl
        default_ttl = var.default_ttl
        max_ttl     = var.max_ttl
    }

    custom_error_response {
        error_code         = 403
        response_code      = 200
        response_page_path = "/index.html"
    }

    custom_error_response {
        error_code         = 404
        response_code      = 200
        response_page_path = "/index.html"
    }

    restrictions {
        geo_restriction {
            restriction_type = "none"
        }
    }

    viewer_certificate {
        cloudfront_default_certificate = true
    }
}