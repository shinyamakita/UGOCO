module "vpc" {
    source  = "terraform-aws-modules/vpc/aws"
    version = "~> 5.0"

    name = local.vpc_name
    cidr = var.vpc_cidr

    azs = data.aws_availability_zones.available.names
    private_subnets = [
        cidrsubnet(var.vpc_cidr, 8, 1),
        cidrsubnet(var.vpc_cidr, 8, 2)
    ]

    enable_nat_gateway = false
    enable_vpn_gateway = false

    tags = local.common_tags
}

module "sg" {
    source  = "terraform-aws-modules/security-group/aws"
    version = "~> 5.0"

    name   = local.sg_name
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

module "aws_vpc_endpoint" "dynamodb" {
    vpc_id = module.vpc.vpc_id
    service_name = "com.amazonaws.${var.aws_region}.dynamodb"
    route_table = module.vpc.private_route_table_ids
}