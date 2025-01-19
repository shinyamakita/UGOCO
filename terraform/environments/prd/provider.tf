provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Environment = "prd"
      Service     = "UGOCO"
      Terraform   = "true"
    }
  }
}