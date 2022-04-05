resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr
}

resource "aws_subnet" "public" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.public_subnet
  availability_zone = var.az
}

resource "aws_subnet" "private" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.private_subnet
  availability_zone = var.az
}

resource "aws_subnet" "data" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.data_subnet
  availability_zone = var.az
}
