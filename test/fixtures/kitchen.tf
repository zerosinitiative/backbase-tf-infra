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
      type        = "egress"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  tags = {
    "Name"        = "Development"
    "Environment" = "Backbase-dev"
  }
}

output "s3_bucket_name" {
  value = module.dev_machine.s3_bucket_name
}

output "dynamodb_table_name" {
  value = module.dev_machine.dynamodb_table_name
}