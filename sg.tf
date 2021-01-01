resource "aws_security_group" "backbase_dev_sg" {
  name        = "backbase_dev_sg"
  vpc_id      = var.vpc_id
  description = "Security group for development machine"
}

resource "aws_security_group_rule" "backbase_dev_sg_rules" {
  for_each          = var.custom_rules
  type              = each.value.type
  from_port         = each.value.from_port
  to_port           = each.value.to_port
  protocol          = each.value.protocol
  cidr_blocks       = each.value.cidr_blocks
  security_group_id = aws_security_group.backbase_dev_sg.id
}