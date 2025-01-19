provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Environment = "prd"
      Project     = "UGOCO"
      Terraform   = "true"
    }
  }
}