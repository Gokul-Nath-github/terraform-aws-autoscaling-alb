provider "aws" {
  region = var.region
}
resource "aws_vpc" "asg_alb_vpc" {
  cidr_block = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support = true

  tags = {
    Name = "custom vpc"
  }
}
resource "aws_internet_gateway" "new-igw" {
  vpc_id = aws_vpc.asg_alb_vpc.id
  tags = {
    Name = "new-igw"
  }
}
resource "aws_subnet" "south1" {
  vpc_id = aws_vpc.asg_alb_vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "ap-south-1a"

  tags = {
    Name = "south1"
  }
}
resource "aws_subnet" "south2" {
  vpc_id = aws_vpc.asg_alb_vpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "ap-south-1b"

  tags = {
    Name = "south2"
  }
}
resource "aws_route_table" "new_rt" {
  vpc_id = aws_vpc.asg_alb_vpc.id

  route  {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.new-igw.id
  }
  tags = {
    Name = "new_route_table"
  }
}
resource "aws_route_table_association" "south1_rt" {
  subnet_id = aws_subnet.south1.id
  route_table_id = aws_route_table.new_rt.id
}
resource "aws_route_table_association" "south2_rt" {
  subnet_id = aws_subnet.south2.id
  route_table_id = aws_route_table.new_rt.id
}
resource "aws_security_group" "alb_sg" {
  name = var.sg_name
  description = var.sg_description
  vpc_id = aws_vpc.asg_alb_vpc.id
  dynamic "ingress" {
    for_each = var.ingress_value
    content {
      from_port = ingress.value
      to_port = ingress.value
      protocol = "tcp"
      cidr_blocks = var.sg_cidr
    }
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = var.sg_cidr
  }
}