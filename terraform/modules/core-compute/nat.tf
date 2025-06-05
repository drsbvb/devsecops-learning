resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.eip_vpc.id
  subnet_id     = aws_subnet.public[0].id

  tags = {
    Name = var.NGWName
  }
  depends_on = [aws_internet_gateway.igw_drs]
}
