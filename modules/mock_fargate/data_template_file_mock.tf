data "template_file" "task" {
  template = file(
    "${path.module}/templates/task.json.tmpl",
  )

  vars = {
    region                     = var.region
    epdq_image                 = var.epdq_image
    epdq_log_group             = aws_cloudwatch_log_group.epdq.name
    epdq_stream_prefix         = "${local.csi}-ecs-epdq"
    epdq_name                  = local.epdq_name
    epdq_response_domain       = "https://mock-epdq-${var.environment}-public.dvsa.tars.dev-dvsacloud.uk"
    gov_gateway_image          = var.gov_gateway_image
    gov_gateway_log_group      = aws_cloudwatch_log_group.gov_gateway.name
    gov_gateway_stream_prefix  = "${local.csi}-ecs-gov-gateway"
    gov_gateway_name           = local.gov_gateway_name
    gov_gateway_auth_callbacks = "https://tars-${var.environment}-cpc-internet.dvsa.tars.dev-dvsacloud.uk/cpctrain/login?app=CPCER, https://obs-${var.environment}-public.dvsa.tars.dev-dvsacloud.uk/obs-web/login?app=OBS, https://tars-${var.environment}-cpc-internet.dvsa.tars.dev-dvsacloud.uk/cpctrain/login?app=CPCDA"
    gov_gateway_return_url     = "https://tars-${var.environment}-cpc-internet.dvsa.tars.dev-dvsacloud.uk/cpctrain/login?app=CPCER"
    gov_gateway_issuer         = "https://mock-gov-gateway-${var.environment}-public.dvsa.tars.dev-dvsacloud.uk"
  }
}
