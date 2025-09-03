resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/24"
}

resource "aws_subnet" "my_subnet" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "10.0.0.0/25"

  tags = {
    Name = "Main"
  }
}

resource "aws_subnet" "my_subnet2" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "10.0.0.128/25"

  tags = {
    Name = "Main"
  }
}