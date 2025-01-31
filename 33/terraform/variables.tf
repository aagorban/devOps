variable "vpc_cidr" {
  default     = "10.1.0.0/16"
  description = "The VPC CIDR used to create the selo first."
}

variable "public_subnet_cidr" {
  default     = "10.1.1.0/24"
  description = "The CIDR block for the public subnet."
}

variable "private_subnet_cidr_a" {
  description = "CIDR block for the first private subnet"
  default     = "10.1.2.0/24"
}

variable "private_subnet_cidr_b" {
  description = "CIDR block for the second private subnet"
  default     = "10.1.3.0/24"
}


variable "ami_id" {
  description = "AMI to build the instances from."
  default     = "ami-075449515af5df0d1"
}

variable "instance_type" {
  description = "The type of the instance to use when creating selo first boot."
  default     = "t3.micro"
}

variable "key_name" {
  description = "The name of the key pair to use for the servers."
  default     = "aws"
}

# Оголошення змінної db_user
variable "db_user" {
  description = "The database username"
  type        = string
}

# Оголошення змінної db_password
variable "db_password" {
  description = "The database password"
  type        = string
  sensitive   = true  # Це забезпечить, що пароль не буде виведено в логах
}