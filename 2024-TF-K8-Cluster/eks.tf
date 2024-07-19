
module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "20.2.1"

  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  # Por seguridad debería ser false, pero no tengo VPN con AWS
  cluster_endpoint_private_access = true
  cluster_endpoint_public_access  = true

  cluster_addons = {
    coredns = {
      resolve_conflict = "OVERWRITE"
    }
    vpc-cni = {
      resolve_conflict = "OVERWRITE"
    }
    kube-proxy = {
      resolve_conflict = "OVERWRITE"
    }
    csi = {
      resolve_conflict = "OVERWRITE"
    }
  }

  # create_aws_auth_configmap = true
  # manage_aws_auth_configmap = true

  eks_managed_node_groups = {
    node-group = {
      desired_capacity = 1
      max_capacity     = 2
      min_capacity     = 1
      # instance_types   = ["t3.medium"]
      instance_types = ["t2.medium"]

      tags = {
        Terraform   = "true"
        Environment = var.environment
        FullName    = local.full_name
      }
    }
  }

}
