module "dynamdb_table" {
    source  = "terraform-aws-modules/dynamodb-table/aws"
    version = "3.3.0"

    name     = "${var.name_prefix}-table"
    hash_key = "id"
 
    attributes = [
        {
            name = "id"
            type = "S"
        }
    ]

    billing_mode = "PAY_PER_REQUEST"
    point_in_time_recovery_enabled = false
    server_side_encryption_enabled = true
}