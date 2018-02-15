resource "aws_iam_role" "api_gateway" {
  name = "${format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "apig"
  )}"

  assume_role_policy = "${data.aws_iam_policy_document.apig_assumerole.json}"
}
