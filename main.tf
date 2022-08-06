terraform {
  backend "remote" {
    organization = "try_me"
    workspaces {
      name = "aws_vpc_sample"
    }
  }
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
  source             = "github.com/benlottejnr/aws_vpc_sample/tree/master/modules/webserver"

  devclass_name      = "ben10"
}

