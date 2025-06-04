resource "aws_internet_gateway" "igw_drs" {
  vpc_id = aws_vpc.vpc_ccousin.id
  tags = {
    Name = var.IGWName
  }
}
