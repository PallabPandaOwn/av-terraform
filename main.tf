terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "test-tf" {
  ami           = "ami-0d4cbf33677f7d3c5"
  instance_type = "t2.micro"

  tags = {
    Name = "Test-TF"
  }
}