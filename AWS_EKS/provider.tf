provider "aws" {

    region = "us-east-1"
   
}

terraform {
  backend "s3" {
    bucket = "state-eks-trraform"
    key    = "state-eks"
    region = "us-east-1"
  }
}