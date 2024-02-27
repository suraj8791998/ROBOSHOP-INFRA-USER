module "vpc_creation" {
  source       = "../TERRAFORM-VPC-ADVANCED"
  cidr_block   = var.cidr_block
  common_tags  = var.common_tags
  project_name = var.project_name

  public_cidr   = var.public_cidr
  public_subnet = var.public_subnet

  private_cidr   = var.private_cidr
  private_subnet = var.private_subnet

  database_cidr   = var.database_cidr
  database_subnet = var.database_subnet
}