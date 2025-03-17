resource "aws_iam_role" "instance_role" {
  name = "${var.prefix}-instance-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_instance_profile" "instance_profile" {
  name = "${var.prefix}-api-instance-profile"
  role = aws_iam_role.instance_role.name
}

resource "aws_iam_role_policy_attachment" "admin_policy_attachment" {
  role = aws_iam_role.instance_role.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}