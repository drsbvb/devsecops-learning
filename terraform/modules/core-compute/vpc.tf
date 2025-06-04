resource "aws_vpc" "vpc_drs" {
  cidr_block           = var.VpcCidr
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  tags = {
    Name = var.VpcName
  }
}
