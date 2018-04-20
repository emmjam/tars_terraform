# The IAM Role that AWS Config will assume to grant it permission
# to read the account's configuration and to write output to the
# bucket created by this module
resource "aws_iam_role" "main" {
  name = "${format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    var.module
  )}"

  assume_role_policy = "${data.aws_iam_policy_document.assumerole.json}"
}
