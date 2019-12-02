resource "aws_iam_group" "readonly_platform" {
  count = "${length(var.readonly_platform_users) == 0 ? 0 : 1}"
  name = "ReadOnlyPlatform"
  path = "/"
}
