variable "security_group_ids" {
  description = "The security group IDs for the RDS instance"
  type        = list(string)
}

variable "subnet_ids" {
  description = "The subnet IDs for the RDS instance"
  type        = list(string)
}

variable "db_username" {
  description = "The database username"
  type        = string
}

variable "db_password" {
  description = "The database password"
  type        = string
  sensitive   = true
}
