resource "aws_iam_role_policy" "sesnotifications_lambda_basic_execution_lambda-execution-policy" {
    count = var.enable_bounced_email_report

    name = format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "sesnotifications_lambda_basic_execution_policy"
  )
    role   ="${var.project}-${var.environment}-${var.component}-sesnotifications_lambda_basic_execution_role"
    policy = data.aws_iam_policy_document.sesnotification_lambda_policy[count.index].json
}

resource "aws_iam_role_policy" "sesreport_lambda_basic_execution_lambda-execution-policy" {
    count = var.enable_bounced_email_report

    name = format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "sesreport_lambda_basic_execution_policy"
  )
    role   ="${var.project}-${var.environment}-${var.component}-sesreport_lambda_basic_execution_role"
    policy = data.aws_iam_policy_document.sesreport_lambda_policy[count.index].json
}
