provider "aws" {
  region = "us-east-1"
}

module "security_group" {
  source   = "../../modules/security_group"
  env_name = "prod"
  vpc_id   = "vpc-yyyyyyyy"  # Replace with your prod VPC ID
}

module "ec2_instance" {
  source            = "../../modules/ec2_instance"
  env_name          = "prod"
  ami_id            = "ami-0c55b159cbfafe1f0"  # Replace with valid AMI
  instance_type     = "t2.medium"
  subnet_id         = "subnet-yyyyyyyy"        # Replace with your prod subnet
  security_group_id = module.security_group.security_group_id
}
