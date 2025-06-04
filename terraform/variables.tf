# Module core-compute
variable "VpcName" {
  type = string
}
variable "VpcCidr" {
  type = string
}
variable "CidrInternet" {
  type = string
}
variable "PublicRTName" {
  type = string
}
variable "PrivateRTName" {
  type = string
}
variable "IGWName" {
  type = string
}
variable "NGWName" {
  type = string
}
variable "PublicSubnetName" {
  type = string
}
variable "PrivateSubnetName" {
  type = string
}
variable "Ec2Name" {
  type = string
}
variable "Ec2Name2" {
  type = string
}
variable "InstanceType" {
  type = string
}
variable "SgName" {
  type = string
}
variable "SubnetAllowed" {
  type = string
}
variable "SshKeyName" {
  type = string
}
variable "SshKeyPath" {
  type = string
}

# Main Variables 
variable "EksClusterName" {
  type = string
}
variable "EksNodeGroupName" {
  type = string
}
variable "DesiredSize" {
  type = number
}
variable "MaxSize" {
  type = number
}
variable "MinSize" {
  type = number
}
variable "MaxUnavailable" {
  type = number
}
variable "EksNodeRoleName" {
  type = string
}
variable "AlbName" {
  type = string
}
variable "AlbType" {
  type = string
}
variable "AlbTgName" {
  type = string
}
variable "AddonCNVersion" {
  type = string
}






