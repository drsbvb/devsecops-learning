resource "aws_security_group" "traffic_allowed" {
  vpc_id      = aws_vpc.vpc_drs.id
  name        = var.SgName

  tags = {
    Name = var.SgName
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh_ingress" {
  security_group_id = aws_security_group.traffic_allowed.id
  cidr_ipv4         = var.CidrInternet
  from_port         = 22
  to_port           = 22
  ip_protocol       = "tcp"
}

resource "aws_vpc_security_group_ingress_rule" "allow_http_ingress" {
  security_group_id = aws_security_group.traffic_allowed.id
  cidr_ipv4         = var.CidrInternet
  from_port         = 80
  to_port           = 80
  ip_protocol       = "tcp"
}

resource "aws_vpc_security_group_ingress_rule" "allow_https_ingress" {
  security_group_id = aws_security_group.traffic_allowed.id
  cidr_ipv4         = var.CidrInternet
  from_port         = 443
  to_port           = 443
  ip_protocol       = "tcp"
}

resource "aws_vpc_security_group_egress_rule" "allow_egress" {
  security_group_id = aws_security_group.traffic_allowed.id
  cidr_ipv4         = var.CidrInternet
  ip_protocol       = "-1"
}
