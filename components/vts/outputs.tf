output "api_gateway_url" {
  value = "${module.vts.api_gateway_url}"
}

output "public_url" {
  value = "https://${module.vts.r53_fqdn}"
}
