resource "aws_iam_role" "sesnotifications_lambda_basic_execution" {
    count = var.enable_bounced_email

    name = format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "sesnotifications_lambda_basic_execution_role"
  )
    path               = "/"
    description        = "SES Notifications Lambda Role"

    assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}

resource "aws_iam_role" "sesreport_lambda_basic_execution" {
    count = var.enable_bounced_email

    name = format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "sesreport_lambda_basic_execution_role"
  )
    path               = "/"
    description        = "SES Report Lambda Role"

    assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}
