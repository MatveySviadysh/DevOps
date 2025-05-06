resource "aws_instance" "bastion" {
  ami                         = var.bastion_ami
  instance_type               = var.bastion_instance_type
  subnet_id                   = var.public_subnet_id
  vpc_security_group_ids      = [var.bastion_sg_id]
  associate_public_ip_address = true
  key_name                    = var.key_name

  tags = {
    Name = "Bastion Host"
  }
}

resource "aws_instance" "private_server" {
  ami                    = var.private_server_ami
  instance_type          = var.private_server_instance_type
  subnet_id              = var.private_subnet_id
  vpc_security_group_ids = [var.private_sg_id]
  key_name               = var.key_name

  tags = {
    Name = "Private Server"
  }
}

output "bastion_instance_id" {
  value = aws_instance.bastion.id
}

output "private_server_instance_id" {
  value = aws_instance.private_server.id
}
