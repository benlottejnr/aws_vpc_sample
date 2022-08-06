terraform {
  backend "remote" {
    organization = "try_me"
    workspaces {
      name = "hcl-example"
    }
  }
  required_version = ">= 0.13"
}


resource "aws_vpc" "devclass" {
  cidr_block           = var.vpc_cidr_block
  instance_tenancy     = "default"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "${var.devclass_name}"
  }
}


resource "aws_subnet" "devclassa" {
  vpc_id                  = aws_vpc.devclass.id
  cidr_block              = var.subneta_cidr_block
  map_public_ip_on_launch = true
  availability_zone       = "${var.availability_zone}a"

  tags = {
    Name       = "${var.devclass_name}"
    SubnetName = "public-subnet-1a"
  }
}


resource "aws_subnet" "devclassb" {
  vpc_id                  = aws_vpc.devclass.id
  cidr_block              = var.subnetb_cidr_block
  map_public_ip_on_launch = true
  availability_zone       = "${var.availability_zone}b"

  tags = {
    Name       = "${var.devclass_name}"
    SubnetName = "public-subnet-1b"
  }
}


resource "aws_internet_gateway" "devclass" {
  vpc_id = aws_vpc.devclass.id

  tags = {
    Name = "${var.devclass_name}"
  }
}


resource "aws_route_table" "devclass" {
  vpc_id = aws_vpc.devclass.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.devclass.id
  }

  tags = {
    Name = "${var.devclass_name}"
  }
}


resource "aws_route_table_association" "devclassa" {
  subnet_id      = aws_subnet.devclassa.id
  route_table_id = aws_route_table.devclass.id
}


resource "aws_route_table_association" "devclassb" {
  subnet_id      = aws_subnet.devclassb.id
  route_table_id = aws_route_table.devclass.id
}


resource "aws_instance" "devclassa" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = "${aws_subnet.devclassa.id}"


  tags = {
    Name       = "${var.devclass_name} a"
  }
}


resource "aws_instance" "devclassb" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = "${aws_subnet.devclassb.id}"


  tags = {
    Name       = "${var.devclass_name} b"
  }
}