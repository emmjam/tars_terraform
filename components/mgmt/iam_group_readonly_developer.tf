resource "aws_iam_group" "readonly_developer" {
  name = "ReadOnlyDeveloper"
  path = "/"
}
