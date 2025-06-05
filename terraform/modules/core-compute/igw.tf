resource "aws_internet_gateway" "igw_drs" {
  vpc_id = aws_vpc.vpc_drs.id
  tags = {
    Name = var.IGWName
  }
}
