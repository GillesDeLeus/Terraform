terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region     = "eu-west-3"
  access_key = "AKIA57MDVIHIQ6BEXCF5"
  secret_key = "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"
}

resource "aws_security_group" "allow_tls" {
  name = "my_security_group"

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [var.vpn_ip]
    //cidr_blocks = [aws_eip.lb.public_ip/32]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [var.vpn_ip]
  }

  ingress {
    from_port   = 53
    to_port     = 53
    protocol    = "tcp"
    cidr_blocks = [var.vpn_ip]
  }
}
