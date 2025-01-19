module "vpc" {
    source = "../../shared/vpc

    environment = var.environment
    aws_region  = var.aws_region
}

module "cloudfront" {
    source = "../../modules/cloudfront"
    
    environment = var.environment
    aws_region  = var.aws_region
}

module "s3" {
    source = "../../modules/s3"

    environment = var.environment
    aws_region  = var.aws_region
}

module "api_gateway" {
    source = "../../modules/api_gateway"

    environment = var.environment
    aws_region  = var.aws_region
}

module "lambda" {
    source = "../../modules/lambda"

    environment = var.environment
    aws_region  = var.aws_region
}

module "dynamo_db" {
    environment = var.environment
    aws_region  = var.aws_region
}