resource "aws_iam_instance_profile" "backbase_iam_profile" {
  name = var.instance_profile_name
  role = aws_iam_role.bb_role.name
}

resource "aws_iam_policy" "bb_policy" {
  name        = "bb-admin-access"
  description = "Administrator access policy for development machine"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "*"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}

resource "aws_iam_role" "bb_role" {
  name = var.role_name
  path = "/"

  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "sts:AssumeRole",
            "Principal": {
               "Service": "ec2.amazonaws.com"
            },
            "Effect": "Allow",
            "Sid": ""
        }
    ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "bb_policy_role" {
  role       = aws_iam_role.bb_role.name
  policy_arn = aws_iam_policy.bb_policy.arn
}