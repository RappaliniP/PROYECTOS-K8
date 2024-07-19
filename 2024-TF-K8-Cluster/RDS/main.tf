
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.20.0"
    }
  }
}

provider "aws" {
  region     = var.region
  access_key = var.access_key
  secret_key = var.secret_key
}

locals {
  extra_tag = "DevOps_Assignment-Pablo_Rappalini"
}

resource "aws_db_instance" "default" {
  # RDS NAME
  identifier = "mi-rds"
  # SIZE STORAGE
  allocated_storage = 10
  storage_type      = "gp2"
  # ENGINE
  engine         = "mysql"
  engine_version = "8.0"
  # INSTANCE FAMILY
  instance_class = "db.t3.micro"
  # DB DETAILS
  db_name             = "mi_db"
  username            = "main"
  password            = "12345678"
  skip_final_snapshot = true
  # TAGS
  tags = {
    ExtraTag = local.extra_tag
    env      = terraform.workspace
    Name     = format("%s-%s", local.extra_tag, "rds")
  }

}
