resource "aws_subnet" "private_a" {
  vpc_id            = aws_vpc.cluster_vpc.id
  cidr_block        = "10.0.0.0/19"
  availability_zone = "${var.region}a"

  tags = {
    "Name"                                      = "private-${var.region}1a"
    "kubernetes.io/role/internal-elb"           = "1"
    "kubernetes.io/cluster/${var.cluster_name}" = "owned"
  }
}

resource "aws_subnet" "private_b" {
  vpc_id            = aws_vpc.cluster_vpc.id
  cidr_block        = "10.0.32.0/19"
  availability_zone = "${var.region}b"

  tags = {
    "Name"                                      = "private-${var.region}1b"
    "kubernetes.io/role/internal-elb"           = "1"
    "kubernetes.io/cluster/${var.cluster_name}" = "owned"
  }
}

resource "aws_subnet" "private_c" {
  vpc_id            = aws_vpc.cluster_vpc.id
  cidr_block        = "10.0.64.0/19"
  availability_zone = "${var.region}c"

  tags = {
    "Name"                                      = "private-${var.region}1c"
    "kubernetes.io/role/internal-elb"           = "1"
    "kubernetes.io/cluster/${var.cluster_name}" = "owned"
  }
}

resource "aws_subnet" "public_a" {
  vpc_id                  = aws_vpc.cluster_vpc.id
  cidr_block              = "10.0.96.0/19"
  availability_zone       = "${var.region}a"
  map_public_ip_on_launch = true

  tags = {
    "Name"                                      = "public-${var.region}1a"
    "kubernetes.io/role/elb"                    = "1"
    "kubernetes.io/cluster/${var.cluster_name}" = "owned"
  }
}

resource "aws_subnet" "public_b" {
  vpc_id                  = aws_vpc.cluster_vpc.id
  cidr_block              = "10.0.128.0/19"
  availability_zone       = "${var.region}b"
  map_public_ip_on_launch = true

  tags = {
    "Name"                                      = "public-${var.region}1b"
    "kubernetes.io/role/elb"                    = "1"
    "kubernetes.io/cluster/${var.cluster_name}" = "owned"
  }
}

resource "aws_subnet" "public_c" {
  vpc_id                  = aws_vpc.cluster_vpc.id
  cidr_block              = "10.0.160.0/19"
  availability_zone       = "${var.region}c"
  map_public_ip_on_launch = true

  tags = {
    "Name"                                      = "public-${var.region}1c"
    "kubernetes.io/role/elb"                    = "1"
    "kubernetes.io/cluster/${var.cluster_name}" = "owned"
  }
}
