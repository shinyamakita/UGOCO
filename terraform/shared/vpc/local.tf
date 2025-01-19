locals {
  name_prefix = "$(var.service_name)-${var.environment}"
  
  vpc_name         = "${local.name_prefix}-vpc"
  sg_name          = "${local.name_prefix}-sg"

  cluster_name     = "${local.name_prefix}-cluster"
  task_family_name = "${local.name_prefix}-task"
  service_name     = "${local.name_prefix}-service"
}