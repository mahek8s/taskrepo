#Application Load Balancer
resource "aws_lb" "main" {
  name               = var.alb_variables.app_alb
  internal           = var.alb_variables.alb_internal
  load_balancer_type = var.alb_variables.load_balancer_type
  security_groups    = [aws_security_group.alb_security_group.id]
  subnets            = [for value in aws_subnet.public_subnet : value.id] 

  tags = merge(local.required_tags, { Name = "Application-ALB" })
}

#Application Load Balancer Listener
resource "aws_lb_listener" "main" {
  load_balancer_arn = aws_lb.main.arn
  port              = var.alb_variables.alb_listener_port
  protocol          = var.alb_variables.alb_listener_protocol

  default_action {
    type             = var.alb_variables.alb_listener_type
    target_group_arn = aws_lb_target_group.main.arn
  }
}

#Application Load Balancer Target Group
resource "aws_lb_target_group" "main" {
  name     = var.alb_variables.alb_target_group
  port     = var.alb_variables.alb_target_group_port
  protocol = var.alb_variables.alb_target_group_protocol
  vpc_id   = aws_vpc.main.id

  health_check {
    protocol  = var.alb_variables.alb_target_group_protocol
    port     = var.alb_variables.alb_target_group_port
  }
}

# ALB - Security Group
resource "aws_security_group" "alb_security_group" {
  name        = var.alb_variables.alb_security_group_name
  description = "Security Group for Application Load Balancer"
  vpc_id      = aws_vpc.main.id

    dynamic "ingress" {
    for_each = local.ingress_rules

    content {
      description = ingress.value.description
      from_port   = ingress.value.port
      to_port     = ingress.value.port
      protocol    = "tcp"
      cidr_blocks = [var.cidr_block]

    }
  }

  dynamic "egress" {
    for_each = local.egress_rules

    content {
      description = egress.value.description
      from_port   = egress.value.port
      to_port     = egress.value.port
      protocol    = "-1"
      cidr_blocks = [var.cidr_block]

    }
  }

  tags = merge(local.required_tags, { Name = "ALB-Security-Group" })
}
