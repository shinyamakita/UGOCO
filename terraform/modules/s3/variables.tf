variable "cloudfront_oai_iam_arn" {
    type = string
    description = "CloudFront Origin Access Identity IAM ARN"
}

variable "enable_versioning" {
    type = bool
    description = "Enable versioning for the S3 bucket"
    default = true
}