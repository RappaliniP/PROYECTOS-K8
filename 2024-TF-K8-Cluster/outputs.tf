output "cluster_arn" {
  value = module.eks.cluster_arn
}

output "VPC" {
  value = module.vpc.vpc_id
}
