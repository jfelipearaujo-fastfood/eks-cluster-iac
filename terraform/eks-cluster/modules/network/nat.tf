resource "aws_eip" "eip" {
  domain = "vpc"

  tags = {
    Name = "${var.cluster_name}-eip"
  }
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.eip.id
  subnet_id     = aws_subnet.public_a.id

  tags = {
    Name = "${var.cluster_name}-nat"
  }

  depends_on = [aws_internet_gateway.igw]
}
