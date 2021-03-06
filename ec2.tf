resource "aws_instance" "backbase_dev" {
  ami                    = "ami-0d79e4a348c80080f"
  instance_type          = "t2.large"
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.backbase_dev_sg.id]
  iam_instance_profile   = aws_iam_instance_profile.backbase_iam_profile.name
  tags                   = var.tags
}