variable "vpc_cidr" {
  description = "The VPC Network cidr Range"
  type = string
  
}
variable "public_subnet" {
  description = "A list of public subnets inside the VPC"
  type = map(string)
}

variable "private_subnet" {
  description = "A list of private subnets inside the VPC"
  type = map(string)
}
variable "cidr_block" {
  description = "CIDR Block to allow traffic via internet"
  type = string
  default = "0.0.0.0/0"
}

variable "alb_variables" {
  description = "List of maps for alb_variables"
  type = object({
    load_balancer_type        = string
    app_alb                   = string
    alb_internal              = string
    load_balancer_arn         = string
    alb_listener_port         = string
    alb_listener_protocol     = string
    alb_listener_type         = string
    alb_target_group          = string
    alb_target_group_port     = string
    alb_target_group_protocol = string
    alb_security_group_name   = string
  })
  default = {
    load_balancer_type        = "application",
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
}
