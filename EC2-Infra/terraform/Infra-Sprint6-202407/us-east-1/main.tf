
resource "aws_s3_bucket" "engineering-s3-bucket" {
  bucket = "engineering-s3-bucket"
}

resource "aws_instance" "engineering-backend-frontend" {
  ami             = "ami-080e1f13689e07408"  # Ubuntu Server 22.04 LTS (HVM), SSD Volume Type
  instance_type   = "t2.medium"
  subnet_id       = aws_subnet.subnet-engineering.id
  vpc_security_group_ids = [aws_security_group.engineering-security-group.id]
  key_name        = "admin_key"
  root_block_device {
    volume_size = 100
  }

  tags = {
   Name = "engineering-backend-frontend"
  }
}

resource "aws_instance" "engineering-databases" {
  ami             = "ami-080e1f13689e07408"  # Ubuntu Server 22.04 LTS (HVM), SSD Volume Type
  instance_type   = "t2.medium"
  subnet_id       = aws_subnet.subnet-engineering.id
  vpc_security_group_ids = [aws_security_group.engineering-security-group.id]
  key_name        = "admin_key"
  root_block_device {
    volume_size = 100
  }
  tags = {
    Name = "engineering-databases"
  }
}
