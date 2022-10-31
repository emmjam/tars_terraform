resource "aws_lambda_function" "ebs_housekeeping" {
  count = var.ebs_housekeeping_enabled ? 1 : 0

  function_name     = "EBS_volumes_housekeeping"
  description       = "Delete unattached EBS volumes"
  runtime           = "python3.8"
  memory_size       = "128"
  handler           = "unattached-ebs-vols.lambda_handler"
  timeout           = "120"
  publish           = false
  s3_bucket         = "tars-645711882182-eu-west-1-mgmt-mgmt-artefacts"
  s3_key            = "lambda-repo/packages/unattached-ebs-vols/unattached-ebs-vols-${var.unattached_ebs_vols_lambda_version}.zip"
  role              = aws_iam_role.ebs_housekeeping.arn

  environment {
    variables = {
      ENVIRONMENT = var.environment
      MODE        = var.ebs_volume_delete
      DAYS        = var.ebs_volume_days
    }
  }
}

resource "aws_iam_role" "ebs_housekeeping" {
  name = "ebs_housekeeping"
  assume_role_policy = <<-POLICY
  {
    "Version": "2012-10-17",
    "Statement": [
      {
        "Action": "sts:AssumeRole",
        "Principal": {
          "Service": "lambda.amazonaws.com"
        },
        "Effect": "Allow",
        "Sid": ""
      }
    ]
  }
  POLICY
}

resource "aws_cloudwatch_log_group" "ebs_housekeeping" {
  name              = "/aws/lambda/EBS_volumes_housekeeping"
  retention_in_days = 90

  tags = merge(
    var.default_tags,
    {
      "Name" = format(
        "%s-%s-%s/%s",
        var.project,
        var.environment,
        var.component,
        "ebs_housekeeping_logging",
      )
    },
  )
}

resource "aws_iam_role_policy_attachment" "ebs_housekeeping" {
  policy_arn = aws_iam_policy.ebs_housekeeping.arn
  role       = aws_iam_role.ebs_housekeeping.name
}

resource "aws_iam_policy" "ebs_housekeeping" {
  name        = "${local.csi}-ebs-housekeeping"
  description = "IAM policy for ${local.csi}-ebs-housekeeping"
  policy      = data.aws_iam_policy_document.ebs_housekeeping.json
}

data "aws_iam_policy_document" "ebs_housekeeping" {

  statement {
    sid    = "GetfromS3"
    effect = "Allow"

    actions = [
      "s3:GetObject",
      "s3:ListBucket",
    ]

    resources = [
      "*",
    ]
  }

  statement {
    sid    = "DescribeEC2Volumes"
    effect = "Allow"

    actions = [
      "ec2:DescribeInstances", 
      "ec2:DescribeImages",
      "ec2:DescribeTags", 
      "ec2:DescribeVolumes"
    ]

    resources = [
      "*",
    ]
  }

  statement {
    sid    = "DeleteEC2Volumes"
    effect = "Allow"

    actions = [
      "ec2:DeleteVolume"
    ]

    resources = [
      "arn:aws:ec2:*:${var.aws_account_id}:volume/*",
    ]
  }

  statement {
    sid    = "AllowLoggingToCloudwatch"
    effect = "Allow"

    actions = [
      "logs:CreateLogStream",
      "logs:CreateLogDelivery",
      "logs:PutLogEvents"
    ]

    resources = [
      "arn:aws:logs:*:*:*",
    ]
  }

  statement {
    sid    = "AllowCheckingCloudtrail"
    effect = "Allow"

    actions = [
      "cloudtrail:Get*",
      "cloudtrail:Describe*",
      "cloudtrail:List*",
      "cloudtrail:LookupEvents"
    ]

    resources = [
      "*",
    ]
  }
}

# Create the schedule
resource "aws_cloudwatch_event_rule" "ebs_housekeeping" {
  name                = "ebs-housekeeping-lambda"
  description         = "Fires at 7pm on the 1st of each month"
  schedule_expression = "cron(0 19 1 * ? *)"
}

# Trigger lambda based on the schedule
resource "aws_cloudwatch_event_target" "trigger_ebs_housekeeping_lambda_on_schedule" {
  count = var.ebs_housekeeping_enabled ? 1 : 0
  
  rule      = aws_cloudwatch_event_rule.ebs_housekeeping.name
  target_id = "lambda"
  arn       = aws_lambda_function.ebs_housekeeping[count.index].arn
}

resource "aws_lambda_permission" "allow_cloudwatch_to_call_ebs_housekeeping_lambda" {
  count = var.ebs_housekeeping_enabled ? 1 : 0

  statement_id  = "AllowExecutionFromCloudWatch"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.ebs_housekeeping[count.index].function_name
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.ebs_housekeeping.arn
}