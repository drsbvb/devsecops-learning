terraform {
  backend "s3" {
    bucket  = "tf-s3-bucket-cc"
    key     = "terraform.tfstate"
    region  = "us-west-1"
    encrypt = true
  }
}
