resource "aws_instance" "ec2_ubuntu" {
  ami                    = data.aws_ami.ami_ubuntu.id
  instance_type          = var.InstanceType
  vpc_security_group_ids = [aws_security_group.traffic_allowed.id]
  subnet_id              = aws_subnet.private[0].id
  associate_public_ip_address = true
  tags = {
    Name = var.Ec2Name
  }
}

resource "aws_instance" "ec2_ubuntu_pub" {
  ami                    = data.aws_ami.ami_ubuntu.id
  instance_type          = var.InstanceType
  vpc_security_group_ids = [aws_security_group.traffic_allowed.id]
  subnet_id              = aws_subnet.public[0].id
  associate_public_ip_address = true
  key_name               = aws_key_pair.ssh_key.key_name
  tags = {
    Name = var.Ec2Name2
  }
  user_data = <<-EOF
    #!/bin/bash
    sudo apt update -y
    sudo apt install -y 
    sudo systemctl start apache2
    sudo systemctl enable apache2
  EOF
  depends_on = [aws_key_pair.ssh_key]
}
