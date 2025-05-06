variable "vpc_cidr_block" {
  type    = string
  default = "10.0.0.0/16"
}

variable "vpc_name" {
  type    = string
  default = "main-vpc"
}

variable "public_subnet_cidr" {
  type    = string
  default = "10.0.1.0/24"
}

variable "public_subnet_az" {
  type    = string
  default = "us-east-1a"
}

variable "private_a_subnet_cidr" {
  type    = string
  default = "10.0.10.0/24"
}

variable "private_a_subnet_az" {
  type    = string
  default = "us-east-1b"
}

variable "private_b_subnet_cidr" {
  type    = string
  default = "10.0.11.0/24"
}

variable "private_b_subnet_az" {
  type    = string
  default = "us-east-1c"
}

