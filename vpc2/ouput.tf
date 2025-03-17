output "subnets" {
  value = module.vpc.private_subnets
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "rtb_ids" {
  value = module.vpc.private_route_table_ids
}