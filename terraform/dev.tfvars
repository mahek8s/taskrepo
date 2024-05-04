vpc_cidr = "10.0.0.0/16"
public_subnet = {
  "ap-south-1a" : "10.0.0.0/24",
  "ap-south-1b" : "10.0.1.0/24",
}

private_subnet = {
  "ap-south-1a" : "10.0.101.0/24",
  "ap-south-1b" : "10.0.102.0/24",
}

alb_variables = {
    load_balancer_type        = "application"
    app_alb                   = "app-alb"
    alb_internal              = "false"
    load_balancer_arn         = "aws_lb.main.arn"
    alb_listener_port         = "80"
    alb_listener_protocol     = "HTTP"
    alb_listener_type         = "forward"
    alb_target_group          = "alb-target-group"
    alb_target_group_port     = "80"
    alb_target_group_protocol = "HTTP"
    alb_security_group_name   = "alb-app-security-group"
}
