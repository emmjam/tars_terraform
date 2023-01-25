resource "aws_ssm_parameter" "iTEST" {
  name  = "/ian/test/tars/${var.environment}/testvalue"
  type  = "SecureString"
}