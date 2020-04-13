provider "aws" {
  region     = "us-east-1"
  access_key = "################"
  secret_key = "#################################"
}

# Deploy storage

module "storage" {
  source = "./s3_storage"
  project_name = "demoterraformmodule"
}

#Deploy VPC
module "vpc_demo" {
  source = "./network"
  cidr = "192.168.0.0/16"
  private_cidr = "192.168.1.0/24"
  public_cidr  = "192.168.2.0/24"
}

#deploy SG
module "sg_aws" {
  source = "./sg_aws"
  vpc_id = "${module.vpc_demo.vpc_id}"
}

#deploy EC2

module "ec2_demo" {
  source = "./EC2"
  security_groups = "${module.sg_aws.name}"
}

~
