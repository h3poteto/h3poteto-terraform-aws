resource "aws_subnet" "subnet_1" {
  vpc_id                  = "${aws_vpc.vpc.id}"
  cidr_block              = "${lookup(var.subnet_cidr_block, "subnet_1")}"
  availability_zone       = "${lookup(var.availability_zone, "subnet_1")}"
  map_public_ip_on_launch = true

  tags {
    Name    = "${var.service}-${var.env}-subnet-1"
    service = "${var.service}"
    env     = "${var.env}"
    tfstate = "${var.tfstate}"
  }
}

resource "aws_subnet" "subnet_2" {
  vpc_id                  = "${aws_vpc.vpc.id}"
  cidr_block              = "${lookup(var.subnet_cidr_block, "subnet_2")}"
  availability_zone       = "${lookup(var.availability_zone, "subnet_2")}"
  map_public_ip_on_launch = true

  tags {
    Name    = "${var.service}-${var.env}-subnet-2"
    service = "${var.service}"
    env     = "${var.env}"
    tfstate = "${var.tfstate}"
  }
}

resource "aws_subnet" "subnet_3" {
  vpc_id                  = "${aws_vpc.vpc.id}"
  cidr_block              = "${lookup(var.subnet_cidr_block, "subnet_3")}"
  availability_zone       = "${lookup(var.availability_zone, "subnet_3")}"
  map_public_ip_on_launch = true

  tags {
    Name    = "${var.service}-${var.env}-subnet-3"
    service = "${var.service}"
    env     = "${var.env}"
    tfstate = "${var.tfstate}"
  }
}
