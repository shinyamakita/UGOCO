module "vpc" {
    source = "../../shared/vpc

    environment = var.environment
    aws_region  = var.aws_region
}

module "cloudfront" {
    source = "../../modules/cloudfront"
    
    environment = var.environment
    aws_region  = var.aws_region
    s3_bucket_domain_name = module.s3.bucket_domain_name
    price_class = var.price_class
    min_ttl     = var.min_ttl
    default_ttl = var.default_ttl
    max_ttl     = var.max_ttl
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

    ...local.common_vars
    name_prefix = local.name_prefix

    timeout = var.timeout
    memory_size = var.memory_size

    subnet_ids = module.vpc.private_subnet_ids
    security_group_id = module.vpc.lambda_security_group id

    api_gateway_execution_arn = module.api_gateway.execution_arn
    dynamo_table_name = module.dynamodb.table_name
}

module "dynamo_db" {
    environment = var.environment
    aws_region  = var.aws_region
}