terraform {
  backend "s3" {
    bucket  = "drs-bucket-devops"
    key     = "terraform.tfstate"
    region  = "eu-west-3"
    encrypt = true
  }
}
