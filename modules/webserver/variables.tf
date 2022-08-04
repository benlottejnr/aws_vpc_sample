variable "vpc_cidr_block" {
  type         = string
  description  = "cidr block for the main vpc"
  default      = "10.0.0.0/16"
}

variable "subneta_cidr_block" {
  type         = string
  description  = "cidr block for the subnet a"
  default      = "10.0.1.0/24"
}

variable "subnetb_cidr_block" {
  type         = string
  description  = "cidr block for the subnet b"
  default      = "10.0.2.0/24"
}

variable "availability_zone" {
  type         = string
  description  = "availability zone for the subnets"
  default      = "us-east-1"
  #availability zone a or b will be appended in the module's main.tf file
}

variable "devclass_name" {
  type         = string
  description  = "name of webserver being deployed"
  default      = "sample-vpc"
}

variable "ami" {
  type         = string
  description  = "ami id to be installed on instances"
  default      = "ami-052efd3df9dad4825"
}

variable "instance_type" {
  type         = string
  description  = "instance type such as t2.micro or t2.medium etc..."
  default      = "t2.micro"
}
