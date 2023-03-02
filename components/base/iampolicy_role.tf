#Created a policy

resource "aws_iam_policy" "autoscaling_DescribeLifecycleHooks" {
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid = "AllowAutoscalingDescribe"
        Effect = "Allow"
        Action = [
          "autoscaling:DescribeLifecycleHooks"
        ]
        Resource = "*"
      }
    ]
  })
}

#Created a role

resource "aws_iam_role" "accessautoscalingRole" {
  name = "iamrole"

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

  tags = {
    tag = "ASG_access"
  }
}

#attaching the policy to a

resource "aws_iam_policy_attachment" "attachRole" {
  name       = "lifecycle"
  roles      = [aws_iam_role.accessautoscalingRole.name]
  policy_arn = aws_iam_policy.autoscaling_DescribeLifecycleHooks.arn

}

