resource "aws_dynamodb_table" "backbase_table_state_lock" {
  name     = var.table_name
  hash_key = "LockId"
  attribute {
    name = "LockID"
    type = "S"
  }
  tags = var.tags
}