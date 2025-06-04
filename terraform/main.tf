module "core_compute" {
  source = "./modules/core-compute"

  VpcName           = var.VpcName
  VpcCidr           = var.VpcCidr
  IGWName           = var.IGWName
  NGWName           = var.NGWName
  PrivateSubnetName = var.PrivateSubnetName
  PublicSubnetName  = var.PublicSubnetName
  CidrInternet      = var.CidrInternet
  PrivateRTName     = var.PrivateRTName
  PublicRTName      = var.PublicRTName
  Ec2Name           = var.Ec2Name
  Ec2Name2          = var.Ec2Name2
  InstanceType      = var.InstanceType
  SgName            = var.SgName
  SubnetAllowed     = var.SubnetAllowed
  SshKeyName        = var.SshKeyName
  SshKeyPath        = var.SshKeyPath
}
