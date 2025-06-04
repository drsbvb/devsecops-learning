resource "aws_eks_addon" "vpc_cni" {
  cluster_name                = aws_eks_cluster.eks_cluster.name
  addon_name                  = "vpc-cni"
  resolve_conflicts_on_create = "OVERWRITE"
  depends_on                  = [aws_eks_cluster.eks_cluster, aws_eks_node_group.eks_node_group]
}

resource "aws_eks_addon" "coredns" {
  cluster_name                = aws_eks_cluster.eks_cluster.name
  addon_name                  = "coredns"
  resolve_conflicts_on_create = "OVERWRITE"
  addon_version               = var.AddonCNVersion
  configuration_values = jsonencode({
    replicaCount = 2
    tolerations = [{
      key      = "node.cloudprovider.kubernetes.io/uninitialized"
      operator = "Exists"
      effect   = "NoSchedule"
    }]
  })
  depends_on = [aws_eks_cluster.eks_cluster, aws_eks_node_group.eks_node_group]
}

resource "aws_eks_addon" "kube_proxy" {
  cluster_name                = aws_eks_cluster.eks_cluster.name
  addon_name                  = "kube-proxy"
  resolve_conflicts_on_create = "OVERWRITE"
  depends_on                  = [aws_eks_cluster.eks_cluster, aws_eks_node_group.eks_node_group]
}

