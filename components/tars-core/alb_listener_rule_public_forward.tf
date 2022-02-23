resource "aws_lb_listener_rule" "irdt_proxy" {
  #  ProxyPassReverse   "http://irdt-internal.opsdev.nonprod.tars.dev-dvsacloud.uk/DSAWeb"
  count        = contains(var.ibs1_ibs2_redirect_env, var.environment) ? 1 : 0
  listener_arn = aws_alb_listener.apache-https-public.arn
  priority     = "40"

  action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.irdt-frontend2-7443.arn
  }

  condition {
    path_pattern {
    values = ["/DSAWeb"]
    }
  }

  lifecycle {
    create_before_destroy = true
  }
}


resource "aws_lb_listener_rule" "obs_proxy" {
  #  ProxyPassReverse   "http://obs-internal.opsdev.nonprod.tars.dev-dvsacloud.uk/obs-web"
  count        = contains(var.ibs1_ibs2_redirect_env, var.environment) ? 1 : 0
  listener_arn = aws_alb_listener.apache-https-public.arn
  priority     = "55"

  action {
    type             = "forward"
    target_group_arn = data.terraform_remote_state.apps.outputs.obs-tg-8080-arn
  }

  condition {
    path_pattern {
    values = ["/obs-web"]
    }
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_lb_listener_rule" "cpc_proxy" {
  #  ProxyPassReverse   "http://cpc-internal.opsdev.nonprod.tars.dev-dvsacloud.uk/cpcode"
  count        = contains(var.ibs1_ibs2_redirect_env, var.environment) ? 1 : 0
  listener_arn = aws_alb_listener.apache-https-public.arn
  priority     = "70"

  action {
    type             = "forward"
    target_group_arn = data.terraform_remote_state.apps.outputs.cpc-tg-9443-arn
  }

  condition {
    path_pattern {
    values = ["/cpctrain"]
    }
  }

  lifecycle {
    create_before_destroy = true
  }
}