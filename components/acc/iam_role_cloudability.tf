resource "aws_iam_role" "cloudabilityRole" {
  name               = "CloudabilityRole"
  assume_role_policy = "${data.aws_iam_policy_document.allow_cloudability_assumerole.json}"
}
