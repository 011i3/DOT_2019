resource "aws_internet_gateway" "dev-igw" {
  vpc_id = aws_vpc.dev-vpc.id
  tags = {
    Name        = "dev-igw"
    Environment = "dev-env"
  }
}

resource "aws_route_table" "dev-public-crt" {
  vpc_id = aws_vpc.dev-vpc.id

  route {
    //associated subnet can reach everywhere
    cidr_block = "0.0.0.0/0"

    //CRT uses this IGW to reach internet
    gateway_id = aws_internet_gateway.dev-igw.id
  }

  tags = {
    Name        = "dev-public-crt"
    Environment = "dev-env"
  }
}

resource "aws_route_table_association" "dev-crta-public-subnet-1" {
  subnet_id      = aws_subnet.dev-subnet-public-1.id
  route_table_id = aws_route_table.dev-public-crt.id
}

resource "aws_security_group" "ssh-allowed" {
  vpc_id = aws_vpc.dev-vpc.id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"

    // 0.0.0.0/0 means, all ip address are allowed to ssh!!! 
 cidr_blocks = ["0.0.0.0/0"] #limited to personal public ip address
  }

  ingress {
    from_port = 8080
    to_port   = 8080
    protocol  = "tcp"

    // All ip address are allowed to browse on port 8080 
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  tags = {
    Name = "ssh-allowed"
    Environment = "dev-env"
  }
}

