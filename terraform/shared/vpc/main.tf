module "vpc" {
    source  = "terraform-aws-modules/vpc/aws"
    version = "~> 5.0"

    name = "${var.name_prefix}-vpc"
    cidr = var.vpc_cidr

    azs = data.aws_availability_zones.available.names
    private_subnets = [
        cidrsubnet(var.vpc_cidr, 8, 1),
        cidrsubnet(var.vpc_cidr, 8, 2)
    ]

    enable_nat_gateway = false
    enable_vpn_gateway = false
}

module "sg" {
    source  = "terraform-aws-modules/security-group/aws"
    version = "~> 5.0"

    name   = "${var.name_prefix}-sg"
    vpc_id = module.vpc.vpc_id

    egress_with_cidr_blocks = [
        {
            from_port   = 443
            to_port     = 443
            protocol    = "tcp"
            cidr_blocks = [var.vpc_cidr]
        }
    ]
}

module "vpc_endpoint" {
    source = "terraform-aws-modules/vpc/aws//modules/vpc-endpoints"
    version = "5.0.0"

    vpc_id = module.vpc.vpc_id

    endpoints = {
        dynamodb = {
            service = "dynamodb"
            service_type = "Gateway"
            route_table_ids = module.vpc.private_route_table_ids
            policy = data.aws_iam_policy_document.dynamodb_endpoint_policy.json
        }
    }
}