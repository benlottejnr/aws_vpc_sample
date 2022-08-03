variable "vpc_cidr_block" {
  type         = string
  description = "cidr block for the main vpc"
}

variable "subneta_cidr_block" {
  type         = string
  description = "cidr block for the subnet a"
}

variable "subnetb_cidr_block" {
  type         = string
  description = "cidr block for the subnet b"
}

variable "availability_zone" {
  type         = string
  description = "availability zone for the subnets"
  #availability zone a or b will be appended in the module's main.tf file
}

variable "devclass_name" {
  type         = string
  description = "name of webserver being deployed"
}

variable "ami" {
  type         = string
  description = "ami id to be installed on instances"
}

variable "instance_type" {
  type         = string
  description = "instance type such as t2.micro or t2.medium etc..."
}
