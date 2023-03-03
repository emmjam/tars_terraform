resource "aws_ssm_parameter" "paramvalue" {
  name  = "/alim/test"
  type  = "String"
  value = "SuccessMessage"
}

output "aliresource_arn" {

    value = aws_ssm_parameter.paramvalue.arn
}