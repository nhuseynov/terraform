variable "vpc_cidr_block" {}
variable "subnet_cidr_block" {}
variable "avail_zone" {}
variable "env_prefix" {}

resource "aws_vpc" "kgb-vpc" {
  cidr_block = var.vpc_cidr_block

  tags = {
    Name: "${var.env_prefix}-vpc"
  }
}

resource "aws_subnet" "kgb-subnet-1" {
  vpc_id = aws_vpc.kgb-vpc.id 
  cidr_block = var.subnet_cidr_block
  availability_zone = var.avail_zone

  tags = {
    Name: "${var.env_prefix}-subnet"
  }
}

output "kgb-vpc-id" {
  value = aws_vpc.kgb-vpc.id
}

output "kgb-subnet-id" {
  value = aws_subnet.kgb-subnet-1.id
}