output "api_gateway_url" {
  value = "https://${aws_api_gateway_rest_api.atf_account_view.id}.execute-api.${var.aws_region}.amazonaws.com/${var.environment}/"
}

output "r53_fqdn" {
  value = "${aws_route53_record.main.fqdn}"
}
