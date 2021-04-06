data "template_file" "gov_gateway_task" {
  template = file(
    "${path.module}/templates/gov_gateway_task.json.tmpl",
  )

  vars = {
    region                     = var.region
    gov_gateway_image          = var.gov_gateway_image
    gov_gateway_log_group      = aws_cloudwatch_log_group.gov_gateway.name
    gov_gateway_stream_prefix  = "${local.csi}-ecs-gov-gateway"
    gov_gateway_name           = local.gov_gateway_name
    gov_gateway_auth_callbacks = "https://tars-${var.environment}-cpc-internet.dvsa.tars.dev-dvsacloud.uk/cpctrain/login?app=CPCER, https://obs-${var.environment}-public.dvsa.tars.dev-dvsacloud.uk/obs-web/login?app=OBS, https://tars-${var.environment}-cpc-internet.dvsa.tars.dev-dvsacloud.uk/cpctrain/login?app=CPCDA"
    gov_gateway_return_url     = "https://tars-${var.environment}-cpc-internet.dvsa.tars.dev-dvsacloud.uk/cpctrain/login?app=CPCER"
    gov_gateway_issuer         = "https://mock-gov-gateway-${var.environment}-public.dvsa.tars.dev-dvsacloud.uk"
  }
}
