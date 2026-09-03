terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.57.1" # Terraform AWS provider version
    }
  }
  backend "s3" {
    bucket = "remotekcdevops88s-dev"
    key    = "roboshop-dev-bastion"
    region = "us-east-1"
    use_lockfile   = true # Activates S3 native state locking
  }
}

provider "aws" {
  region = "us-east-1"
}

