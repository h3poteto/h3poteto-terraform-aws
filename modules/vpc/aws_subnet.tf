/*
 Public subnet
*/
resource "aws_subnet" "public_subnet_1" {
  vpc_id                  = "${aws_vpc.vpc.id}"
  cidr_block              = "${lookup(var.public_subnet_cidr_block, "subnet_1")}"
  availability_zone       = "${lookup(var.availability_zone, "subnet_1")}"
  map_public_ip_on_launch = true

  tags {
    Name    = "${var.service}-${var.env}-public-1"
    service = "${var.service}"
    env     = "${var.env}"
    tfstate = "${var.tfstate}"
  }
}

resource "aws_subnet" "public_subnet_2" {
  vpc_id                  = "${aws_vpc.vpc.id}"
  cidr_block              = "${lookup(var.public_subnet_cidr_block, "subnet_2")}"
  availability_zone       = "${lookup(var.availability_zone, "subnet_2")}"
  map_public_ip_on_launch = true

  tags {
    Name    = "${var.service}-${var.env}-public-2"
    service = "${var.service}"
    env     = "${var.env}"
    tfstate = "${var.tfstate}"
  }
}

resource "aws_subnet" "public_subnet_3" {
  vpc_id                  = "${aws_vpc.vpc.id}"
  cidr_block              = "${lookup(var.public_subnet_cidr_block, "subnet_3")}"
  availability_zone       = "${lookup(var.availability_zone, "subnet_3")}"
  map_public_ip_on_launch = true

  tags {
    Name    = "${var.service}-${var.env}-public-3"
    service = "${var.service}"
    env     = "${var.env}"
    tfstate = "${var.tfstate}"
  }
}

/*
 Private subnet
*/
resource "aws_subnet" "private_subnet_1" {
  vpc_id                  = "${aws_vpc.vpc.id}"
  cidr_block              = "${lookup(var.private_subnet_cidr_block, "subnet_1")}"
  availability_zone       = "${lookup(var.availability_zone, "subnet_1")}"
  map_public_ip_on_launch = false

  tags {
    Name    = "${var.service}-${var.env}-private-1"
    service = "${var.service}"
    env     = "${var.env}"
    tfstate = "${var.tfstate}"
  }
}

resource "aws_subnet" "private_subnet_2" {
  vpc_id                  = "${aws_vpc.vpc.id}"
  cidr_block              = "${lookup(var.private_subnet_cidr_block, "subnet_2")}"
  availability_zone       = "${lookup(var.availability_zone, "subnet_2")}"
  map_public_ip_on_launch = false

  tags {
    Name    = "${var.service}-${var.env}-private-2"
    service = "${var.service}"
    env     = "${var.env}"
    tfstate = "${var.tfstate}"
  }
}

resource "aws_subnet" "private_subnet_3" {
  vpc_id                  = "${aws_vpc.vpc.id}"
  cidr_block              = "${lookup(var.private_subnet_cidr_block, "subnet_3")}"
  availability_zone       = "${lookup(var.availability_zone, "subnet_3")}"
  map_public_ip_on_launch = false

  tags {
    Name    = "${var.service}-${var.env}-private-3"
    service = "${var.service}"
    env     = "${var.env}"
    tfstate = "${var.tfstate}"
  }
}
