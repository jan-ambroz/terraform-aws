terraform {
  backend "s3" {

    bucket         = "terraform-up-and-running-state-9933"
    key            = "stage/data-stores/mysql/terraform.tfstate"
    region         = "us-east-2"
    dynamodb_table = "terraform-up-and-running-locks"
    encrypt        = true

  }
}

provider "aws" {
  region = "us-east-2"
}

resource "aws_db_instance" "example" {
  identifier_prefix   = "terraform-up-and-running"
  engine              = "mysql"
  allocated_storage   = 10
  instance_class      = "db.t2.micro"

  username            = "admin"

  name                = var.db_name
  skip_final_snapshot = true

  password            = var.db_password
}
