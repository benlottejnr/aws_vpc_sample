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

  devclass_name      = "ben10"
}

