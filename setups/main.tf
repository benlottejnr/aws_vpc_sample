terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

module "bens_webserver" {
  source             = "../modules/webserver"

  vpc_cidr_block     = "10.0.0.0/16"
  subneta_cidr_block = "10.0.1.0/24"
  subnetb_cidr_block = "10.0.2.0/24"
  availability_zone  = "us-east-1"
  devclass_name      = "ben10"
  ami                = "ami-052efd3df9dad4825"
  instance_type      = "t2.micro"
}

