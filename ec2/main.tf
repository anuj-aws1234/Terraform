provider "aws" {
  region     = "us-east-1"
  access_key = "AKIARKEJLOMUK6UTFNPW"
  secret_key = "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"
}



data "aws_ami" "linux" {
  most_recent = true

  filter {
    name     = "name"
    values   = ["amzn-ami-hvm-2018.03.0.20200318.2-x86_64-gp2"]
}
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
}
  owners =["amazon"]
}

resource "aws_instance" "web" {
  ami           = "${data.aws_ami.linux.id}"
  instance_type = "t2.micro"

  tags = {
    Name = "HelloWorld"
  }
}
