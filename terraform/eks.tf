resource "aws_eks_cluster" "eks_cluster" {
  name     = var.EksClusterName
  role_arn = data.aws_iam_role.iam_role_student.arn

  vpc_config {
    subnet_ids = [
      module.core_compute.private_subnet_ids[0],
      module.core_compute.private_subnet_ids[1]
    ]
  }
  depends_on = [data.aws_iam_role.iam_role_student]
}

resource "aws_eks_node_group" "eks_node_group" {
  cluster_name    = var.EksClusterName
  node_group_name = var.EksNodeGroupName
  node_role_arn   = aws_iam_role.eks_node_role.arn
  subnet_ids      = module.core_compute.private_subnet_ids

  scaling_config {
    desired_size = var.DesiredSize
    max_size     = var.MaxSize
    min_size     = var.MinSize
  }
  instance_types = [var.InstanceType]

  update_config {
    max_unavailable = var.MaxUnavailable
  }
  depends_on = [aws_eks_cluster.eks_cluster, aws_iam_role.eks_node_role]
}

