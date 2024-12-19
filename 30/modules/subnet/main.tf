resource "aws_subnet" "public" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.public_cidr_block
  map_public_ip_on_launch = true
  availability_zone       = var.availability_zone
  tags = {
    Name = "${var.name}-public"
  }
}

resource "aws_subnet" "private" {
  vpc_id            = var.vpc_id
  cidr_block        = var.private_cidr_block
  availability_zone = var.availability_zone
  tags = {
    Name = "${var.name}-private"
  }
}