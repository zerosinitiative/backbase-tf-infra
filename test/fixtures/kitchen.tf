provider "aws" {
  region  = "us-east-1"
  version = ">= 3.1.0"
}

module "dev_machine" {
  source = "../.."
  providers = {
    aws = aws
  }
  bucket_name   = "backbase-terraform-backend"
  table_name    = "backbase-tf-lock"
  topic_name    = "bb-cinotif"
  ecr_repo_name = "backbase-tomcat"
  vpc_id        = "vpc-368a7b4b"
  key_name      = "mywebserverng"
  custom_rules = {
    dev_machine = {
      type        = "ingress"
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["27.5.239.252/32"]
    },
    dev_machine_jenkins = {
      type        = "ingress"
      from_port   = 8080
      to_port     = 8080
      protocol    = "tcp"
      cidr_blocks = ["27.5.239.252/32"]
    }
  }
  tags = {
    "Environment" = "Backbase-dev"
  }
}