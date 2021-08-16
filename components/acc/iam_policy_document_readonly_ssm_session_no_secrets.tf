data "aws_iam_policy_document" "readonly_ssm_session_no_secrets" {
  statement {
    sid    = "DenyKMSSecrets"
    effect = "Deny"

    actions = [
      "kms:*"
    ]

    resources = [
      "*",
    ]
  }

  statement {
    sid    =  "DenySSMSecrets"
    effect = "Deny"

    actions = [
      "ssm:Add*",
      "ssm:Associate*",
      "ssm:Cancel*",
      "ssm:Create*",
      "ssm:Delete*",
      "ssm:DescribeA*",
      "ssm:DescribeD*",
      "ssm:DescribeE*",
      "ssm:DescribeInstanceAssociationsStatus",
      "ssm:DescribeInstanceInformation",
      "ssm:DescribeInstancePatch*",
      "ssm:DescribeInventoryDeletions",
      "ssm:DescribeO*",
      "ssm:DescribeM*",
      "ssm:DescribeP*",
      "ssm:Deregister*",
      "ssm:DisassociateOpsItemRelatedItem",
      "ssm:GetA*",
      "ssm:GetCalendarState",
      "ssm:GetCommandInvocation",
      "ssm:GetD*",
      "ssm:GetI*",
      "ssm:GetM*",
      "ssm:GetO*",
      "ssm:GetP*",
      "ssm:GetS*",
      "ssm:LabelParameterVersion",
      "ssm:List*",
      "ssm:ModifyDocumentPermission",
      "ssm:Put*",
      "ssm:Register*",
      "ssm:Remove*",
      "ssm:ResetServiceSetting",
      "ssm:ResumeSession",
      "ssm:Send*",
      "ssm:StartAutomationExecution",
      "ssm:StartAssociationsOnce",
      "ssm:StartChangeRequestExecution",
      "ssm:StopAutomationExecution",
      "ssm:Update*"
    ]

    resources = [
      "*",
      "arn:aws:ssm:*:${var.aws_account_id}:patchbaseline/*",
      "arn:aws:s3:::*",
      "arn:aws:ssm:*:${var.aws_account_id}:maintenancewindow/*",
      "arn:aws:ssm:*:${var.aws_account_id}:opsitem/*",
      "arn:aws:ssm:*:${var.aws_account_id}:parameter/*",
      "arn:aws:ssm:*:${var.aws_account_id}:opsmetadata/*",
      "arn:aws:ssm:*:${var.aws_account_id}:servicesetting/*",
      "arn:aws:ssm:*:${var.aws_account_id}:session/*",
      "arn:aws:ssm:*:${var.aws_account_id}:document/*",
      "arn:aws:ssm:*:${var.aws_account_id}:association/*",
      "arn:aws:ssm:*:${var.aws_account_id}:automation-definition/*:*",
      "arn:aws:ssm:*:${var.aws_account_id}:resource-data-sync/*",
      "arn:aws:ec2:*:${var.aws_account_id}:instance/*"
    ]
  }

  statement {
    sid    = "AllowSSMStartSession"
    effect = "Allow"

    actions = [
      "ssm:StartSession"
    ]

    resources = [
      "arn:aws:ec2:*:${var.aws_account_id}:instance/*",
    ]
  }

  statement {
    sid    =  "AllowSSMTerminateSession"
    effect = "Allow"

    actions = [
      "ssm:TerminateSession"
    ]

    resources = [
      "arn:aws:ssm:*:*:session/$${aws:username}-*",
    ]
  }

  statement {
    sid    =  "AllowSSMDescribeSession"
    effect = "Allow"

    actions = [
      "ssm:DescribeInstanceProperties",
      "ssm:DescribeSessions",
      "ssm:GetConnectionStatus"
    ]

    resources = [
      "*",
    ]
  }
}

