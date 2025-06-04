resource "aws_key_pair" "ssh_key" {
  key_name   = var.SshKeyName
  public_key = file(var.SshKeyPath)
}

