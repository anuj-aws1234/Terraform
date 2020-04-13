provider "aws" {
  region     = "us-east-1"
  access_key = "AKIARKEJLOMUK6UTFNPW"
  secret_key = "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"
}



resource "aws_security_group" "demo_SG" {
  name        = "demo_sg"
  description = "Allow SSH inbound traffic"
  vpc_id      = "default"

  ingress {
    description = "SSH from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
     }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_ssh"
  }
}
