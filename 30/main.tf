module "vpc" {
  source     = "./modules/vpc"
  cidr_block = "10.0.0.0/16"
  name       = "BRO-vpc"
}

module "subnet" {
  source             = "./modules/subnet"
  vpc_id             = module.vpc.vpc_id
  public_cidr_block  = "10.0.1.0/24"
  private_cidr_block = "10.0.2.0/24"
  availability_zone  = "eu-north-1a"
  name               = "BRO-subnet"
}

module "ec2" {
  source            = "./modules/ec2"
  ami               = "ami-02a0945ba27a488b7"
  instance_type     = "t3.micro"
  public_subnet_id  = module.subnet.public_subnet_id
  private_subnet_id = module.subnet.private_subnet_id
  name              = "BRO-ec2"
}

resource "aws_s3_bucket" "imported_bucket" {
  bucket = "bro-bucket1010"
}