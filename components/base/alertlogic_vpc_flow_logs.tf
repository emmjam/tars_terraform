### Alert Logic Cloud Defender
### Takes VPC Flow Logs (stored in CloudWatch Logs) per Environment and exports them via Kinesis Firehose to an S3 Bucket
### The external AlertLogic AWS Account reads the logs in our S3 Bucket and consumes them into their monitoring system for alerting

## S3 Bucket to receive/store VPC Logs from CloudWatch Logs
resource "aws_s3_bucket" "alertlogic_vpc_logs" {
  count  = length(var.alert_logic) == 0 ? 0 : 1
  bucket = "alertlogic-${local.csi}-vpc-logs"
}

## IAM Role for this account's Firehose to access/write to S3
data "aws_iam_policy_document" "firehose_to_al_vpc_s3_trustpolicy" {
  count = length(var.alert_logic) == 0 ? 0 : 1
  statement {
    sid    = "1"
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["firehose.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]

    condition {
      test     = "StringEquals"
      variable = "sts:ExternalId"

      values = [
        var.aws_account_id,
      ]
    }
  }
}

data "aws_iam_policy_document" "firehose_to_al_vpc_s3_permissions" {
  count = length(var.alert_logic) == 0 ? 0 : 1
  statement {
    sid    = "1"
    effect = "Allow"

    actions = [
      "s3:AbortMultipartUpload",
      "s3:GetBucketLocation",
      "s3:GetObject",
      "s3:ListBucket",
      "s3:ListBucketMultipartUploads",
      "s3:PutObject",
    ]

    resources = [
      aws_s3_bucket.alertlogic_vpc_logs[0].arn,
      "${aws_s3_bucket.alertlogic_vpc_logs[0].arn}/*",
    ]
  }
}

resource "aws_iam_role" "firehose_to_al_vpc_s3" {
  count              = length(var.alert_logic) == 0 ? 0 : 1
  name               = "${local.csi}-firehose_to_al_vpc_s3"
  assume_role_policy = data.aws_iam_policy_document.firehose_to_al_vpc_s3_trustpolicy[0].json
}

resource "aws_iam_policy" "firehose_to_al_vpc_s3" {
  count       = length(var.alert_logic) == 0 ? 0 : 1
  name        = "${local.csi}-firehose_to_al_vpc_s3"
  description = ""
  policy      = data.aws_iam_policy_document.firehose_to_al_vpc_s3_permissions[0].json
}

resource "aws_iam_role_policy_attachment" "firehose_to_al_vpc_s3_role_policy_attachment" {
  count      = length(var.alert_logic) == 0 ? 0 : 1
  role       = aws_iam_role.firehose_to_al_vpc_s3[0].name
  policy_arn = aws_iam_policy.firehose_to_al_vpc_s3[0].arn
}

## Kinesis Firehose Delivery Stream
resource "aws_kinesis_firehose_delivery_stream" "firehose_to_al_vpc_s3" {
  count       = length(var.alert_logic) == 0 ? 0 : 1
  name        = "${local.csi}-delivery_stream"
  destination = "s3"

  ## TODO: extended_s3_configuration for lambda processing
  ##       https://www.terraform.io/docs/providers/aws/r/kinesis_firehose_delivery_stream.html#processing_configuration
  s3_configuration {
    role_arn   = aws_iam_role.firehose_to_al_vpc_s3[0].arn
    bucket_arn = aws_s3_bucket.alertlogic_vpc_logs[0].arn
  }
}

## Create IAM Role to grant CloudWatch Logs the permission to put data into the Kinesis stream
resource "aws_iam_role" "al_vpc_cwl_to_ks" {
  count              = length(var.alert_logic) == 0 ? 0 : 1
  name               = "${local.csi}-al_vpc_cwl_to_ks"
  assume_role_policy = data.aws_iam_policy_document.al_vpc_cwl_trustpolicy[0].json
}

data "aws_iam_policy_document" "al_vpc_cwl_trustpolicy" {
  count = length(var.alert_logic) == 0 ? 0 : 1
  statement {
    sid    = "1"
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["logs.${var.aws_region}.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_policy" "al_vpc_cwl_to_ks" {
  count       = length(var.alert_logic) == 0 ? 0 : 1
  name        = "${local.csi}-al_vpc_cwl_to_ks"
  description = ""
  policy      = data.aws_iam_policy_document.al_vpc_cwl_to_ks_permissions[0].json
}

data "aws_iam_policy_document" "al_vpc_cwl_to_ks_permissions" {
  count = length(var.alert_logic) == 0 ? 0 : 1
  statement {
    sid     = "1"
    effect  = "Allow"
    actions = ["firehose:*"]

    resources = [
      "*",
    ]
  }

  statement {
    sid     = "2"
    effect  = "Allow"
    actions = ["iam:PassRole"]

    resources = [
      aws_iam_role.al_vpc_cwl_to_ks[0].arn,
    ]
  }
}

resource "aws_iam_role_policy_attachment" "al_vpc_cwl_to_ks" {
  count      = length(var.alert_logic) == 0 ? 0 : 1
  role       = aws_iam_role.al_vpc_cwl_to_ks[0].name
  policy_arn = aws_iam_policy.al_vpc_cwl_to_ks[0].arn
}

## CWL Subscription Filter
## Send data matching our filter (everything) to kinesis
resource "aws_cloudwatch_log_subscription_filter" "firehose_to_al_vpc_s3" {
  count           = length(var.alert_logic) == 0 ? 0 : 1
  name            = "${local.csi}-firehose_to_al_vpc_s3"
  role_arn        = aws_iam_role.al_vpc_cwl_to_ks[0].arn
  log_group_name  = "${local.csi}-vpc-flow-logs" ### CHECKME
  filter_pattern  = ""
  destination_arn = aws_kinesis_firehose_delivery_stream.firehose_to_al_vpc_s3[0].arn
  distribution    = "ByLogStream"
}

###############################################################################

### Create a Cross-Account Role for AlertLogic to access the VPC Log Bucket

data "aws_iam_policy_document" "cross_account_role_s3_policy_document" {
  count = length(var.alert_logic) == 0 ? 0 : 1
  statement {
    sid = "AllowGetObjects"

    effect = "Allow"

    actions = [
      "s3:GetObjectVersionAcl",
      "s3:GetObject",
      "s3:GetObjectAcl",
    ]

    resources = [
      "${aws_s3_bucket.alertlogic_vpc_logs[0].arn}/*",
    ]
  }

  statement {
    sid = "GetListBucketRoot"

    effect = "Allow"

    actions = [
      "s3:ListBucket",
      "s3:GetBucket*",
    ]

    resources = [
      aws_s3_bucket.alertlogic_vpc_logs[0].arn,
    ]
  }
}

data "aws_iam_policy_document" "role_assume_trusted_resources_s3" {
  count = length(var.alert_logic) == 0 ? 0 : 1
  statement {
    actions = [
      "sts:AssumeRole",
    ]

    condition {
      test     = "StringEquals"
      variable = "sts:ExternalId"

      values = [
        var.customer_id,
      ]
    }

    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::${var.alertlogic_account_id}:root"]
    }
  }
}

resource "aws_iam_role" "cross_account_role_s3" {
  count              = length(var.alert_logic) == 0 ? 0 : 1
  name               = "${local.csi}-${var.alertlogic_account_id}-role-s3"
  description        = "A role to be assumed by role ALERTLOGIC within ${var.alertlogic_account_id} for collecting logs via S3"
  assume_role_policy = data.aws_iam_policy_document.role_assume_trusted_resources_s3[0].json

  provisioner "local-exec" {
    command = "sleep 45"
    # Wait for eventual consistency before moving on to dependant resources
  }
}

resource "aws_iam_policy" "cross_account_role_s3_policy" {
  count  = length(var.alert_logic) == 0 ? 0 : 1
  name   = "${aws_iam_role.cross_account_role_s3[0].name}-POLICY"
  policy = data.aws_iam_policy_document.cross_account_role_s3_policy_document[0].json
}

resource "aws_iam_policy_attachment" "cross_account_role_s3_policy_attachment" {
  count      = length(var.alert_logic) == 0 ? 0 : 1
  name       = "${aws_iam_policy.cross_account_role_s3_policy[0].name}-ATT"
  policy_arn = aws_iam_policy.cross_account_role_s3_policy[0].arn
  roles      = [aws_iam_role.cross_account_role_s3[0].name]
}

###############################################################################

### Create a Cross-Account Role for AlertLogic CloudDefender

resource "aws_iam_policy" "cross_account_role_discovery_policy" {
  count  = length(var.alert_logic) == 0 ? 0 : 1
  name   = "${aws_iam_role.cross_account_role_discovery[0].name}-POLICY"
  policy = data.aws_iam_policy_document.cross_account_discovery_role_policy_document[0].json
}

resource "aws_iam_policy_attachment" "cross_account_role_discovery_policy_attachment" {
  count      = length(var.alert_logic) == 0 ? 0 : 1
  name       = "${aws_iam_policy.cross_account_role_discovery_policy[0].name}-ATT"
  policy_arn = aws_iam_policy.cross_account_role_discovery_policy[0].arn
  roles      = [aws_iam_role.cross_account_role_discovery[0].name]
}

resource "aws_iam_role" "cross_account_role_discovery" {
  count              = length(var.alert_logic) == 0 ? 0 : 1
  name               = "${local.csi}-${var.alertlogic_account_id}-discovery-role"
  description        = "A role to be assumed by role ALERTLOGIC within ${var.alertlogic_account_id} for service and iam discovery only"
  assume_role_policy = data.aws_iam_policy_document.role_assume_trusted_resources[0].json

  provisioner "local-exec" {
    command = "sleep 45"
    # Wait for eventual consistency before moving on to dependant resources
  }
}

data "aws_iam_policy_document" "role_assume_trusted_resources" {
  count = length(var.alert_logic) == 0 ? 0 : 1
  statement {
    actions = ["sts:AssumeRole"]

    condition {
      test     = "StringEquals"
      variable = "sts:ExternalId"

      values = [
        var.customer_id,
      ]
    }

    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::${var.alertlogic_account_id}:root"]
    }
  }
}

data "aws_iam_policy_document" "cross_account_discovery_role_policy_document" {
  count = length(var.alert_logic) == 0 ? 0 : 1
  statement {
    sid       = "EnabledDiscoveryOfVariousAWSServices"
    effect    = "Allow"
    resources = ["*"]

    actions = [
      "autoscaling:Describe*",
      "cloudformation:DescribeStack*",
      "cloudformation:GetTemplate",
      "cloudformation:ListStack*",
      "cloudfront:Get*",
      "cloudfront:List*",
      "cloudwatch:Describe*",
      "config:DeliverConfigSnapshot",
      "config:Describe*",
      "config:Get*",
      "config:ListDiscoveredResources",
      "cur:DescribeReportDefinitions",
      "directconnect:Describe*",
      "dynamodb:ListTables",
      "ec2:Describe*",
      "elasticbeanstalk:Describe*",
      "elasticache:Describe*",
      "elasticloadbalancing:Describe*",
      "elasticmapreduce:DescribeJobFlows",
      "events:Describe*",
      "events:List*",
      "glacier:ListVaults",
      "guardduty:Get*",
      "guardduty:List*",
      "kinesis:Describe*",
      "kinesis:List*",
      "kms:DescribeKey",
      "kms:GetKeyPolicy",
      "kms:GetKeyRotationStatus",
      "kms:ListAliases",
      "kms:ListGrants",
      "kms:ListKeys",
      "kms:ListKeyPolicies",
      "kms:ListResourceTags",
      "lambda:List*",
      "logs:Describe*",
      "rds:Describe*",
      "rds:ListTagsForResource",
      "redshift:Describe*",
      "route53:GetHostedZone",
      "route53:ListHostedZones",
      "route53:ListResourceRecordSets",
      "sdb:DomainMetadata",
      "sdb:ListDomains",
      "sns:ListSubscriptions",
      "sns:ListSubscriptionsByTopic",
      "sns:ListTopics",
      "sns:GetEndpointAttributes",
      "sns:GetSubscriptionAttributes",
      "sns:GetTopicAttributes",
      "s3:ListAllMyBuckets",
      "s3:ListBucket",
      "s3:GetBucketLocation",
      "s3:GetObject",
      "s3:GetBucket*",
      "s3:GetLifecycleConfiguration",
      "s3:GetObjectAcl",
      "s3:GetObjectVersionAcl",
      "tag:GetResources",
      "tag:GetTagKeys",
    ]
  }

  statement {
    sid       = "EnableInsightDiscovery"
    effect    = "Allow"
    resources = ["*"]

    actions = [
      "iam:Get*",
      "iam:List*",
      "iam:GenerateCredentialReport",
    ]
  }

  statement {
    sid       = "EnableCloudTrailIfAccountDoesntHaveCloudTrailsEnabled"
    effect    = "Allow"
    resources = ["*"]

    actions = [
      "cloudtrail:DescribeTrails",
      "cloudtrail:GetEventSelectors",
      "cloudtrail:GetTrailStatus",
      "cloudtrail:ListPublicKeys",
      "cloudtrail:ListTags",
      "cloudtrail:LookupEvents",
      "cloudtrail:StartLogging",
      "cloudtrail:UpdateTrail",
    ]
  }

  statement {
    sid       = "CreateCloudTrailS3BucketIfCloudTrailsAreBeingSetupByAlertLogic"
    effect    = "Allow"
    resources = ["arn:aws:s3:::outcomesbucket-*"]

    actions = [
      "s3:CreateBucket",
      "s3:PutBucketPolicy",
      "s3:DeleteBucket",
    ]
  }

  statement {
    sid       = "CreateCloudTrailsTopicTfOneWasntAlreadySetupForCloudTrails"
    effect    = "Allow"
    resources = ["arn:aws:sns:*:*:outcomestopic"]

    actions = [
      "sns:CreateTopic",
      "sns:DeleteTopic",
    ]
  }

  statement {
    sid       = "MakeSureThatCloudTrailsSnsTopicIsSetupCorrectlyForCloudTrailPublishingAndSqsSubsription"
    effect    = "Allow"
    resources = ["arn:aws:sns:*:*:*"]

    actions = [
      "sns:AddPermission",
      "sns:GetTopicAttributes",
      "sns:ListTopics",
      "sns:SetTopicAttributes",
      "sns:Subscribe",
    ]
  }

  statement {
    sid       = "CreateAlertLogicSqsQueueToSubscribeToCloudTrailsSnsTopicNotifications"
    effect    = "Allow"
    resources = ["arn:aws:sqs:*:*:outcomesbucket*"]

    actions = [
      "sqs:CreateQueue",
      "sqs:DeleteQueue",
      "sqs:SetQueueAttributes",
      "sqs:GetQueueAttributes",
      "sqs:ReceiveMessage",
      "sqs:DeleteMessage",
      "sqs:GetQueueUrl",
    ]
  }

  statement {
    sid       = "BeAbleToListSQSForCloudTrail"
    effect    = "Allow"
    resources = ["*"]
    actions   = ["sqs:ListQueues"]
  }

  statement {
    sid       = "EnableAlertLogicApplianceStateManagement"
    effect    = "Allow"
    resources = ["arn:aws:ec2:*:*:instance/*"]

    actions = [
      "ec2:GetConsoleOutput",
      "ec2:GetConsoleScreenShot",
      "ec2:StartInstances",
      "ec2:StopInstances",
      "ec2:TerminateInstances",
    ]

    condition {
      test     = "StringEquals"
      variable = "ec2:ResourceTag/AlertLogic"
      values   = ["Security"]
    }
  }

  statement {
    sid       = "EnableAlertLogicAutoScalingGroupManagement"
    effect    = "Allow"
    resources = ["arn:aws:autoscaling:*:*:autoScalingGroup/*"]
    actions   = ["autoscaling:UpdateAutoScalingGroup"]

    condition {
      test     = "StringEquals"
      variable = "ec2:ResourceTag/AlertLogic"
      values   = ["Security"]
    }
  }
}

