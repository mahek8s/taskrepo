terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.48.0"
    }
  }
  required_version = ">= 1.5.7"
}

provider "aws" {
  # Configuration options can be done using aws cli which needs to be installed and we need to do aws configure and export the access key and secret key
  region = "ap-south-1"
}
