output "vpc_creation" {
  value = module.vpc_creation.vpc_id
}

output "public_id" {
  value = module.vpc_creation.public_subnet_ids

}

output "private_ids" {
  value = module.vpc_creation.private_subnet_ids
}