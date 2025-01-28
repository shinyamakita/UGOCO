module "api_gateway" {
    source = "terraform-aws-modules/apigateway-v2/aws"
    version = "2.2.2"

    name = "${var.service_name}-${var.environment}-api"
    description = "HTTP API Gateway for ${var.service_name}"
    protocol_type = "HTTP"

    create_api_domain_name = false

    cors_configuration = {
        allow_headers = ["*"]
        allow_methods = ["GET", "POST", "OPTIONS"]
        allow_origins = [module.cloudfront.domain_name]
        max_age = 300
    }

    default_stage_access_log_destination_arn = module.cloudwatch.log_group_arn

    integrations = {
        for method in ["GET", "POST"] : "${method} \items" => {
            integration_type = "AWS_PROXY"
            integration_uri = module.lambda.lambda_function_invoke_arn
            integration_method = "POST"
            timeout_milliseconds = 29000
        }
    }

    tags = {
        APIType = "HTTP"
    }
}