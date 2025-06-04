resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.vpc_ccousin.id
  route {
    cidr_block = var.CidrInternet
    gateway_id = aws_nat_gateway.nat_gw.id
  }
  tags = {
    Name = var.PrivateRTName
  }
}

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.vpc_ccousin.id
  route {
    cidr_block = var.CidrInternet
    gateway_id = aws_internet_gateway.igw_ccousin.id
  }
  tags = {
    Name = var.PublicRTName
  }
}

resource "aws_route_table_association" "private" {
  count          = length(aws_subnet.private)
  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private_route_table.id
}

resource "aws_route_table_association" "public" {
  count          = length(aws_subnet.public)
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public_route_table.id
}
