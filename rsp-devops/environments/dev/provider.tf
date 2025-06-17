terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.98.0"
    }


  }
    backend "s3" {
      bucket       = "studydevops-remote-state"
      key          = "studydevops-remote-state-demo"
      use_lockfile = true
      region       = "us-east-1"
    }

}


provider "aws" {
  region = "us-east-1"
}
