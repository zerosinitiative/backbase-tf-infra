resource "aws_sns_topic" "backbase_notif" {
  name = var.topic_name
}