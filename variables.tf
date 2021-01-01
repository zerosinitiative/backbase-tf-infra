variable "bucket_name" {
  description = "The bucket name for state locking feature of terraform"
  type        = string
}

variable "table_name" {
  description = "The dynamodb table name for state locking feature of terraform"
  type        = string
}

variable "topic_name" {
  description = "The sns topic name for sending notifications through the pipeline for continuous visibility"
  type        = string
}

variable "ecr_repo_name" {
  description = "The ECR repo name for storing docker images of the WAR application"
  type        = string
}

variable "vpc_id" {
  description = "The VPC ID to create the security group for the development machine"
  type        = string
}

variable "custom_rules" {
  description = "Custom SG rules to apply for the development machine"
  type = map(object({
    type        = string,
    from_port   = number,
    to_port     = number,
    protocol    = string,
    cidr_blocks = list(string)
  }))
  default = {}
}

variable "key_name" {
  description = "The key pair name to use for the EC2 instance"
  type        = string
}

variable "tags" {
  description = "The tags to associate with all resources created through this module"
  type        = map(any)
  default     = {}
}