resource "aws_iam_role" "mysql" {
  name = local.mysql_role_name # Robospop-Dev-Mysql

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })

  tags = merge(
    {
        Name = local.mysql_role_name
    },
    local.common_tags
  )
}

resource "aws_iam_policy" "mysql" {
  name       = local.mysql_policy_name
  description = "Policy for MySQL access from EC2 Instance"
  policy = file("mysql-iam-policy.json")
}

resource "aws_iam_role_policy_attachment" "mysql" {
  role       = aws_iam_role.mysql.name
  policy_arn = aws_iam_policy.mysql.arn
}