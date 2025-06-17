provider "aws" {
  region = "us-east-1"
}

module "security_group" {
  source   = "../../modules/security_group"
  env_name = "dev"
  vpc_id   = "vpc-xxxxxxxx"  # Replace with your dev VPC ID
}

module "ec2_instance" {
  source            = "../../modules/ec2_instance"
  env_name          = "dev"
  ami_id            = "ami-0c55b159cbfafe1f0"  # Replace with valid AMI
  instance_type     = "t2.micro"
  subnet_id         = "subnet-xxxxxxxx"        # Replace with your dev subnet
  security_group_id = module.security_group.security_group_id
}
