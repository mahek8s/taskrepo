#vpc 
resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr

  tags = merge(local.required_tags, { Name = "VPC-Development" })
}

#Public subnet
resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.main.id
  for_each                = var.public_subnet
  availability_zone       = each.key
  cidr_block              = each.value
  map_public_ip_on_launch = "true" #makes this a public subnet

  tags = merge(local.required_tags, { Name = "Public-Subnet-dev" })
}

#Private subnet
resource "aws_subnet" "private_subnet" {
  vpc_id            = aws_vpc.main.id
  for_each          = var.private_subnet
  availability_zone = each.key
  cidr_block        = each.value

  tags = merge(local.required_tags, { Name = "Private-Subnet-dev" })
}

#Internet Gateway for the Public Subnet
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = merge(local.required_tags, { Name = "Internet-Gateway" })
}

#Route Table for the Internet Gateway / Public Subnet
resource "aws_route_table" "main" {
  vpc_id = aws_vpc.main.id
  for_each = var.public_subnet

  route {
    cidr_block             = var.cidr_block
    gateway_id             = aws_internet_gateway.main.id
  }

  tags = merge(local.required_tags, { Name = "Public-Route-Table" })
}

#Route table associations - Public
resource "aws_route_table_association" "main" {
  subnet_id      = aws_subnet.public_subnet[each.key].id
  for_each       = var.public_subnet
  route_table_id = aws_route_table.main[each.key].id
}