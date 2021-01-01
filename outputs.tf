output "s3_bucket_name" {
  value = aws_s3_bucket.backbase_s3_state_lock.id
}

output "dynamodb_table_name" {
  value = aws_dynamodb_table.backbase_table_state_lock.id
}