
module "security-group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 3.16"

  name        = "${var.cluster_name}-${var.environment}-sg"
  description = "Access to the public facing Load Balancer"
  vpc_id      = module.vpc.vpc_id

  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules       = ["http-80-tcp", "https-443-tcp"]

  egress_cidr_blocks = ["0.0.0.0/0"]
  egress_rules       = ["all-all"]
}
