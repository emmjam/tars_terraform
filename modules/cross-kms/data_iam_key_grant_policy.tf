data "aws_iam_policy_document" "grant_policy" {
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
                        "arn:aws:iam::652856684323:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling",
                     ]
      }
      actions = ["sts:AssumeRole"]
    }

}
