resource "aws_vpc" "devclass" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "devclass"
  }
}


resource "aws_subnet" "devclassa" {
  vpc_id                  = aws_vpc.devclass.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1a"

  tags = {
    Name       = "devclass"
    SubnetName = "public-subnet-1a"
  }
}


resource "aws_subnet" "devclassb" {
  vpc_id                  = aws_vpc.devclass.id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1b"

  tags = {
    Name       = "devclass"
    SubnetName = "public-subnet-1b"
  }
}


resource "aws_internet_gateway" "devclass" {
  vpc_id = aws_vpc.devclass.id

  tags = {
    Name = "devclass"
  }
}


resource "aws_route_table" "devclass" {
  vpc_id = aws_vpc.devclass.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.devclass.id
  }

  tags = {
    Name = "devclass"
  }
}


resource "aws_route_table_association" "devclassa" {
  subnet_id = aws_subnet.devclassa.id
  route_table_id = aws_route_table.devclass.id
}


resource "aws_route_table_association" "devclassb" {
  subnet_id = aws_subnet.devclassb.id
  route_table_id = aws_route_table.devclass.id
}


resource "aws_instance" "devclassa" {
  ami = "ami-0729e439b6769d6ab"
  instance_type = "t2.micro"
  subnet_id = "${aws_subnet.devclassa.id}"


  tags = {
    Name       = "devclass-a"
    VpcName = "1a-instance"
  }
}


resource "aws_instance" "devclassb" {
  ami = "ami-0729e439b6769d6ab"
  instance_type = "t2.micro"
  subnet_id = "${aws_subnet.devclassb.id}"


  tags = {
    Name       = "devclass-b"
    VpcName = "1b-instance"
  }
}