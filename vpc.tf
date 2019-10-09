resource "aws_vpc" "dev-vpc" {
  cidr_block           = "192.168.0.0/16"
  enable_dns_support   = "true" //gives you an internal domain name
  enable_dns_hostnames = "true" //gives you an internal host name
  enable_classiclink   = "false"
  instance_tenancy     = "default"

  tags = {
    Terraform   = "true"
    Environment = "dev-env"
  }
}

resource "aws_subnet" "dev-subnet-public-1" {
  vpc_id                  = aws_vpc.dev-vpc.id
  cidr_block              = "192.168.1.0/24"
  map_public_ip_on_launch = "true" //makes this a public subnet
  availability_zone       = "eu-west-1a"
  tags = {
    Name = "dev-subnet-public-1"
	Environment = "dev-env"
  }
}

resource "aws_subnet" "dev-subnet-public-2" {
  vpc_id                  = aws_vpc.dev-vpc.id
  cidr_block              = "192.168.3.0/24"
  map_public_ip_on_launch = "true" //makes this a public subnet
  availability_zone       = "eu-west-1b"
  tags = {
    Name        = "dev-subnet-public-2"
    Environment = "dev-env"
  }
}

resource "aws_subnet" "dev-subnet-public-3" {
  vpc_id                  = aws_vpc.dev-vpc.id
  cidr_block              = "192.168.5.0/24"
  map_public_ip_on_launch = "true" //makes this a public subnet
  availability_zone       = "eu-west-1c"
  tags = {
    Name        = "dev-subnet-public-3"
    Environment = "dev-env"
  }
}

resource "aws_subnet" "dev-subnet-private-1" {
  vpc_id                  = aws_vpc.dev-vpc.id
  cidr_block              = "192.168.2.0/24"
  map_public_ip_on_launch = "false" //makes this a private subnet
  availability_zone       = "eu-west-1a"
  tags = {
    Name        = "dev-subnet-private-1"
    Environment = "dev-env"
  }
}

resource "aws_subnet" "dev-subnet-private-2" {
  vpc_id                  = aws_vpc.dev-vpc.id
  cidr_block              = "192.168.4.0/24"
  map_public_ip_on_launch = "false" //makes this a private subnet
  availability_zone       = "eu-west-1b"
  tags = {
    Name        = "dev-subnet-private-2"
    Environment = "dev-env"
  }
}

resource "aws_subnet" "dev-subnet-private-3" {
  vpc_id                  = aws_vpc.dev-vpc.id
  cidr_block              = "192.168.6.0/24"
  map_public_ip_on_launch = "false" //makes this a private subnet
  availability_zone       = "eu-west-1c"
  tags = {
    Name        = "dev-subnet-private-3"
    Environment = "dev-env"
  }
}