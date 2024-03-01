resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.cluster_vpc.id

  tags = {
    Name = "${var.cluster_name}-igw"
  }
}
