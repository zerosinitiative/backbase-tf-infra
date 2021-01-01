# Terraform module to create S3 bucket, DynamoDB table, ECR repo, SNS Notif and Subs  
Use this repository to create a development machine to do the entire base infra setup.  
Before executing terraform init, plan and apply on this repository, create a new AWS key pair on the console and provide its name for key\_name argument.  
Execute the terraform init, plan and apply from the test/fixtures directory from your laptop.  
Remember to also replace the cidr\_blocks with your Public IP for SSH & Jenkins access.

```ruby
module "dev_machine" {
  source = "../.."
  providers = {
    aws        = aws
  }
  bucket_name = "backbase-terraform-backend"
  table_name = "backbase-tf-lock"
  topic_name = "bb-cinotif"
  ecr_repo_name = "backbase-tomcat"
  vpc_id     = "vpc-368a7b4b"
  key_name   = "mywebserverng"
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
```

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| bucket\_name | The bucket name for state locking feature of terraform | `string` | n/a | yes |
| ecr\_repo\_name | The ECR repo name for storing docker images of the WAR application | `string` | n/a | yes |
| key\_name | The key pair name to use for the EC2 instance | `string` | n/a | yes |
| table\_name | The dynamodb table name for state locking feature of terraform | `string` | n/a | yes |
| topic\_name | The sns topic name for sending notifications through the pipeline for continuous visibility | `string` | n/a | yes |
| vpc\_id | The VPC ID to create the security group for the development machine | `string` | n/a | yes |
| custom\_rules | Custom SG rules to apply for the development machine | <pre>map(object({<br>    type        = string,<br>    from_port   = number,<br>    to_port     = number,<br>    protocol    = string,<br>    cidr_blocks = list(string)<br>  }))</pre> | `{}` | no |
| tags | The tags to associate with all resources created through this module | `map(any)` | `{}` | no |

## Outputs

No output.

