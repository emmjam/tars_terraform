resource "aws_iam_group" "readonly_platform" {
  name = "ReadOnlyPlatform"
  path = "/"
}
