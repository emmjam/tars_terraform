resource "aws_iam_group" "readonly_dvsa" {
  name = "ReadOnlyDVSA"
  path = "/"
}
