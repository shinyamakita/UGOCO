module "lambda_function" {
    source  = "terraform-aws-modules/lambda/aws"
    version = "5.3.0"

    function_name = "${var.name_prefix}-function"
    description   = "Lambda function for ${var.service_name}"
    handler       = "index.handler"
    runtime       = "nodejs18.x"
    timeout       = var.timeout
    memory_size   = var.memory_size

    vpc_subnet_ids = var.subnet_ids
    vpc_security_group_ids = [var.security_group_id]

    source_path = "../src"

    allowed_triggers = {
        APIGatewayAny = {
            service    = "apigateway"
            source_arn = var.api_gateway_execution_arn
        }
    }

    environment_variables = {
        DYNAMODB_TABLE = var.dynamodb_table_name
    }
}