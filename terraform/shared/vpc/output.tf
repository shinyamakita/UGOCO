output "vpc_id" {
    value = module.vpc.vpc_id
}

output "private_subnet_ids" {
    value = module.vpc.private_subnets
}

output "vpc_endpoint_id" {
    value = module.vpc_endpoint.endpoints["dynamodb"].id
}