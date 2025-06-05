
data "aws_availability_zones" "az" {}


data "aws_ami" "ami_ubuntu" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
}

data "aws_iam_role" "iam_role_student" {
  name = "eks_students"
}

data "aws_iam_policy" "eks_students_policies" {
  name = "students"
}

data "aws_iam_policy" "iam_worker_node_policy" {
  name = "AmazonEKSWorkerNodePolicy"
}

data "aws_iam_policy" "iam_cni_policy" {
  name = "AmazonEKS_CNI_Policy"
}

data "aws_iam_policy" "iam_ec2_container_registry_ro_policy" {
  name = "AmazonEC2ContainerRegistryReadOnly"
}

