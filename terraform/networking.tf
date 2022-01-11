#----------------------------------------------------
#                   NETWORKING
#----------------------------------------------------

#----------------------VPC---------------------------

resource "aws_vpc" "jen_vpc" {
  cidr_block       = var.vpc_cidr_ipv4
  instance_tenancy = "default"

  tags = {
    Name = var.resource_name
  }
}

#--------------------SUBNET--------------------------

resource "aws_subnet" "jen_pub_sub" {
  cidr_block              = var.sb_pub_cidr_ipv4
  vpc_id                  = aws_vpc.jen_vpc.id
  availability_zone       = var.av_zone
  map_public_ip_on_launch = true

  tags = {
    Name = var.resource_name
  }
}

#----------------------IGW---------------------------

resource "aws_internet_gateway" "jen_igw" {
  vpc_id = aws_vpc.jen_vpc.id

  tags = {
    Name = var.resource_name
  }
}

#-----------------ROUTE TABLES-----------------------

resource "aws_route_table" "jen_route_pub" {
  vpc_id = aws_vpc.jen_vpc.id

  route {
    cidr_block = var.ipv4_default
    gateway_id = aws_internet_gateway.jen_igw.id
  }

  tags = {
    Name = var.resource_name
  }
}

resource "aws_route_table_association" "jen_route_pub_assoc" {
  route_table_id = aws_route_table.jen_route_pub.id
  subnet_id      = aws_subnet.jen_pub_sub.id
}
