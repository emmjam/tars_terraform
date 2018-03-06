output "api_gateway_url" {
  value = "${module.webui.api_gateway_url}"
}

output "public_url" {
  value = "https://${module.webui.r53_fqdn}"
}
