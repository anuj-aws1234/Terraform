data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_vpc" "tf_vpc" {
  cidr_block = "${var.cidr}"

  tags {
    name = "tf_vpc"
}
}

resource "aws_subnet" "private" {
  availability_zone = "${data.aws_availability_zones.available.names[0]}"
  vpc_id = "${aws_vpc.tf_vpc.id}"
  cidr_block = "${var.private_cidr}"


  tags {
    name = "private subnet"
}
}

resource "aws_subnet" "public" {
  availability_zone = "${data.aws_availability_zones.available.names[1]}"
  vpc_id = "${aws_vpc.tf_vpc.id}"
  cidr_block = "${var.public_cidr}"


  tags {
    name = "public subnet"
}
}
