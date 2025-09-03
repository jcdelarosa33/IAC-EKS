provider "aws" {
  region = "ap-southeast-1"
}

terraform {
  backend "s3" {
    bucket = "jc-tfstate-backend"
    key    = "terraform.tfstate"
    region = "ap-southeast-1"
  }
}