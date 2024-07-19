
resource "aws_vpc" "vpc-engineering" {
  cidr_block = "10.10.0.0/16"
  tags = {
    Name = "engineering"
  }
}

resource "aws_internet_gateway" "engineering-gateway" {
  vpc_id = aws_vpc.vpc-engineering.id

  tags = {
    Name = "main-engineering-gateway"
  }
}

resource "aws_subnet" "subnet-engineering" {
  vpc_id     = aws_vpc.vpc-engineering.id
  cidr_block = "10.10.1.0/24"
  map_public_ip_on_launch = true
}

resource "aws_route_table" "engineering-route-table-public" {
  vpc_id = aws_vpc.vpc-engineering.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.engineering-gateway.id
  }

  tags = {
    Name = "Public"
  }
}

resource "aws_route_table_association" "public_subnet_association" {
  subnet_id      = aws_subnet.subnet-engineering.id
  route_table_id = aws_route_table.engineering-route-table-public.id
}
