
# Application Load Balancer
module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "~> 5.9"

  name = "${var.cluster_name}-${var.environment}-alb"

  load_balancer_type = "application"

  vpc_id  = module.vpc.vpc_id
  subnets = module.vpc.public_subnets

  target_groups = [{
    target_type      = "ip"
    backend_protocol = "HTTP"
    backend_port     = 80
  }]

  http_tcp_listeners = [{
    port     = 80
    protocol = "HTTP"
  }]
}
