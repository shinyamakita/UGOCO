locals {
    name_prefix = "${var.service_name}-${var.environment}"

    common_vars = {
        environment = var.environment
        aws_region = var.aws_region
    }
}