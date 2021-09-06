resource "aws_iam_role" "soc-organization-read-only" {
  name               = "soc-organization-read-only"
  assume_role_policy = data.aws_iam_policy_document.soc_assumerole.json
}
