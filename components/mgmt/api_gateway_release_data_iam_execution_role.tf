resource "aws_iam_role" "release_data_api_execution_role" {
  name = "${local.csi}-release-data-execution-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "AllowApiGateway"
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "apigateway.amazonaws.com"
        }
      },
    ]
  })
}

resource "aws_iam_policy" "release_data_read_table" {
  name = "${local.csi}-release-data-read"

  policy = jsonencode ({
    Version = "2012-10-17"
    Statement = [
      {
        Action   = [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:DescribeLogGroups",
          "logs:DescribeLogStreams",
          "logs:PutLogEvents",
          "logs:GetLogEvents",
          "logs:FilterLogEvents"
        ]
        Effect   = "Allow"
        Resource = "*"
      },
      {
        Action   = [
          "dynamodb:BatchGetItem",
          "dynamodb:Describe*",
          "dynamodb:List*",
          "dynamodb:GetItem",
          "dynamodb:Query",
        ]
        Effect   = "Allow"
        Resource = [
          aws_dynamodb_table.release_data.arn,
          "${aws_dynamodb_table.release_data.arn}/index/*"
        ]
      },
    ]
  })
}

resource "aws_iam_role_policy_attachment" "release_data_read_table" {
  role       = aws_iam_role.release_data_api_execution_role.name
  policy_arn = aws_iam_policy.release_data_read_table.arn
}
