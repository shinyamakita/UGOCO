output "table_name" {
    value = module.dynamodb_table.dynamodb_table_name
    description = "Name of the DynamoDB table"
}

output "table_arn" {
    value = module.dynamodb_table.dynamodb_table_arn
    description = "ARN of the DynamoDB table"
}