terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.37.0"
    }
  }

  backend "s3" {
    bucket = "roboshop-s3-bucket-suraj"
    key    = "vpc-advance"
    region = "us-east-1"
  }
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}


