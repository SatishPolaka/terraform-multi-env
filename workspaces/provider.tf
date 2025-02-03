terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.84.0"
    }
  }
  backend "s3" {
    bucket = "psrs3"
    key    = "workspace-lock"
    region = "us-east-1"
    dynamodb_table = "psr_state_locking"
  }
    
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}