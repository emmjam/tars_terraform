data "aws_iam_policy_document" "grant_policy" {
  count = contains(["prod","nonprod",var.environment]) ? 1 : 0
  policy_id = format(
    "%s-%s-%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    var.module,
    var.name,
    "grant-policy",
    )

    statement {
      sid = "ProvieRBACGrantPolicy"
      effect = "Allow"
      principals {
        type = "AWS"
        identifiers =[
                        "arn:aws:iam::${data.aws_caller_identity.current}:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
                     ]
      }
      actions = ["sts:AssumeRole"]
    }
}
