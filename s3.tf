resource "aws_s3_bucket" "backbase_s3_state_lock" {
  bucket = var.bucket_name
  versioning {
    enabled = true
  }
  tags = var.tags
}