resource "aws_dynamodb_table" "backbase_table_state_lock" {
  name     = var.table_name
  hash_key = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
  tags = var.tags
}