# EC2 - Security Group 
resource "aws_security_group" "app_security_group" {
  name        = "app_security_group"
  description = "Security Group for EC2 Host"
  vpc_id      = aws_vpc.main.id

  dynamic "ingress" {
    for_each = local.ingress_rules

    content {
      description = ingress.value.description
      from_port   = ingress.value.port
      to_port     = ingress.value.port
      protocol    = "tcp"
      cidr_blocks = [var.vpc_cidr]
      security_groups = [aws_security_group.alb_security_group.id]

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

  tags = merge(local.required_tags, { Name = "EC2-Security-Group" })
}
#ec3 instance in private subnet
resource "aws_instance" "application_server" {
  ami                    = "ami-0f58b397bc5c1f2e8"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.app_security_group.id]
  subnet_id              = aws_subnet.private_subnet["ap-south-1a"].id
  tags = merge(local.required_tags, { Name = "EC2-instance" })
}
