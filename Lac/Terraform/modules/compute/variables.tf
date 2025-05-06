variable "bastion_ami" {
  type    = string
  default = "ami-0c94855ba95c71c99"
}

variable "bastion_instance_type" {
  type    = string
  default = "t2.micro"
}

variable "public_subnet_id" {
  type = string
}

variable "bastion_sg_id" {
  type = string
}

variable "key_name" {
  type = string
  description ="RSA-key"
}

variable "private_server_ami" {
  type    = string
  default = "ami-0c94855ba95c71c99"
}

variable "private_server_instance_type" {
  type    = string
  default = "t2.micro"
}

variable "private_subnet_id" {
  type = string
}

variable "private_sg_id" {
  type = string
}
