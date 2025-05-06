terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region  = "us-east-1"
  profile = "Pert"
}

# Модуль сети
module "network" {
  source = "./modules/network"
}

# Модуль безопасности
module "security" {
  source = "./modules/security"
  vpc_id = module.network.vpc_id  # Используем VPC, созданный в модуле network
}

# Модуль вычислений
module "compute" {
  source              = "./modules/compute"
  public_subnet_id    = module.network.public_subnet_id
  private_subnet_id   = module.network.private_a_subnet_id
  bastion_sg_id       = module.security.bastion_sg_id
  private_sg_id       = module.security.private_sg_id
  key_name            = "RSA-key"  # Укажите свой ключ
}

# Модуль RDS
module "rds" {
  source             = "./modules/rds"
  security_group_ids = [module.security.private_sg_id]
  subnet_ids         = [module.network.public_subnet_id]
  db_username        = "dbuser"
  db_password        = "StrongPassword123!"
}
