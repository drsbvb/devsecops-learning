resource "aws_subnet" "public" {
  count             = length(data.aws_availability_zones.az.names)
  vpc_id            = aws_vpc.vpc_drs.id
  cidr_block        = "10.1.1${count.index}.0/24"
  availability_zone = data.aws_availability_zones.az.names[count.index]
  tags = {
    Name = "${var.PublicSubnetName}-${count.index}"
  }
}

resource "aws_subnet" "private" {
  count             = length(data.aws_availability_zones.az.names)
  vpc_id            = aws_vpc.vpc_drs.id
  cidr_block        = "10.1.2${count.index}.0/24"
  availability_zone = data.aws_availability_zones.az.names[count.index]
  tags = {
    Name = "${var.PrivateSubnetName}-${count.index}"
  }
}
