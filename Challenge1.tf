provider "aws" {
  region = "us-east-1"
}
resource "aws_vpc" "default" {
  cidr_block = "10.0.0.0/16"
}
resource "aws_subnet" "public" {
  vpc_id = aws_vpc.default.id
  cidr_block = "10.0.0.0/24"
}
resource "aws_subnet" "private" {
  vpc_id = aws_vpc.default.id
  cidr_block = "10.0.1.0/24"
}
resource "aws_security_group" "web" {
  vpc_id = aws_vpc.default.id
  ingress {
    protocol = "tcp"
    from_port = 80
    to_port = 80
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    protocol = "all"
    from_port = 0
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}
resource "aws_security_group" "app" {
  vpc_id = aws_vpc.default.id
  ingress {
    protocol = "tcp"
    from_port = 8080
    to_port = 8080
    cidr_blocks = ["0.0.0.0/0"]
  }
