/**
* # Terraform module to create S3 bucket, DynamoDB table, ECR repo, SNS Notif and Subs
* Use this repository to create a development machine to do the entire base infra setup. 
* Before executing terraform init, plan and apply on this repository, create a new AWS key pair on the console and provide its name for key_name argument.
* Execute the terraform init, plan and apply from the test/fixtures directory from your laptop. 
* Remember to also replace the cidr_blocks with your Public IP for SSH & Jenkins access.
*
* ```ruby
* module "dev_machine" {
*   source = "../.."
*   providers = {
*     aws        = aws
*   }
*   bucket_name = "backbase-terraform-backend"
*   table_name = "backbase-tf-lock"
*   topic_name = "bb-cinotif"
*   ecr_repo_name = "backbase-tomcat"
*   vpc_id     = "vpc-368a7b4b"
*   key_name   = "mywebserverng"
*   custom_rules = {
*     dev_machine = {
*       type        = "ingress"
*       from_port   = 22
*       to_port     = 22
*       protocol    = "tcp"
*       cidr_blocks = ["27.5.239.252/32"]
*     },
*     dev_machine_jenkins = {
*       type        = "ingress"
*       from_port   = 8080
*       to_port     = 8080
*       protocol    = "tcp"
*       cidr_blocks = ["27.5.239.252/32"]
*     },
*     dev_machine_egress = {
*      type        = "egress"
*      from_port   = 0
*      to_port     = 0
*      protocol    = "-1"
*      cidr_blocks = ["0.0.0.0/0"]
*    }
*   }
*   tags = {
*     "Environment" = "Backbase-dev"
*   }
* }
* ```
*/
//