/*
 Public subnet
*/
resource "aws_subnet" "public_subnet_1" {
  vpc_id                  = "${aws_vpc.vpc.id}"
  cidr_block              = "${var.public_subnet_1_cidr}"
  availability_zone       = "${var.subnet_1_az}"
  map_public_ip_on_launch = true

  tags {
    Name       = "${var.service}-${var.env}-public-1"
    service    = "${var.service}"
    env        = "${var.env}"
    tfstate    = "${var.tfstate}"
    SubnetType = "Public"
  }
}

resource "aws_subnet" "public_subnet_2" {
  vpc_id                  = "${aws_vpc.vpc.id}"
  cidr_block              = "${var.public_subnet_2_cidr}"
  availability_zone       = "${var.subnet_2_az}"
  map_public_ip_on_launch = true

  tags {
    Name       = "${var.service}-${var.env}-public-2"
    service    = "${var.service}"
    env        = "${var.env}"
    tfstate    = "${var.tfstate}"
    SubnetType = "Public"
  }
}

resource "aws_subnet" "public_subnet_3" {
  vpc_id                  = "${aws_vpc.vpc.id}"
  cidr_block              = "${var.public_subnet_3_cidr}"
  availability_zone       = "${var.subnet_3_az}"
  map_public_ip_on_launch = true

  tags {
    Name       = "${var.service}-${var.env}-public-3"
    service    = "${var.service}"
    env        = "${var.env}"
    tfstate    = "${var.tfstate}"
    SubnetType = "Public"
  }
}

/*
 Private subnet
*/
resource "aws_subnet" "private_subnet_1" {
  vpc_id                  = "${aws_vpc.vpc.id}"
  cidr_block              = "${var.private_subnet_1_cidr}"
  availability_zone       = "${var.subnet_1_az}"
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
  cidr_block              = "${var.private_subnet_2_cidr}"
  availability_zone       = "${var.subnet_2_az}"
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
  cidr_block              = "${var.private_subnet_3_az}"
  availability_zone       = "${var.subnet_3_az}"
  map_public_ip_on_launch = false

  tags {
    Name    = "${var.service}-${var.env}-private-3"
    service = "${var.service}"
    env     = "${var.env}"
    tfstate = "${var.tfstate}"
  }
}
