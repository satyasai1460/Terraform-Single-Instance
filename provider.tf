#This Terraform Code Deploys Basic VPC Infra.
provider "aws" {
  region = var.aws_region
}

terraform {
  required_version = "<= 1.6.2" #Forcing which version of Terraform needs to be used
  required_providers {
    aws = {
      version = "<= 5.0.0" #Forcing which version of plugin needs to be used.
      source  = "hashicorp/aws"
    }
  }
  backend "s3" {
    # Replace this with your bucket name!
    bucket         = "Bucket_Name"
    key            = "devopsb35.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "dynamodb_table"
    encrypt        = true
  }
}
