resource "aws_lb_listener_rule" "rewrite_dsaweb_10" {
  listener_arn = aws_alb_listener.apache-https-public.arn
  priority     = "10"

  action {
    type             = "redirect"
    redirect {
      #host            = #{host}
      path             = "/DSAWeb"
      port             = 443
      protocol         = "HTTPS"
      query            = "TYPE=true"
      status_code      = "HTTP_301"
    }
  }

 #   RewriteRule ^/irdta$        https://%{SERVER_NAME}/DSAWeb/?TYPE=true    [R,L]
  condition {
    path_pattern {
    values = ["/irdta"]
    }
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_lb_listener_rule" "rewrite_dsaweb_20" {
  listener_arn = aws_alb_listener.apache-https-public.arn
  priority     = "20"

  action {
    type             = "redirect"
    redirect {
      #host            = #{host}
      path             = "/DSAWeb/#{path}"
      port             = 443
      protocol         = "HTTPS"
      #query           = #{query}
      status_code      = "HTTP_301"
    }
  }

 #   RewriteRule ^/irdta/(.*)    https://%{SERVER_NAME}/DSAWeb/irdta/$1      [R,L]
  condition {
    path_pattern {
    values = ["/irdta/"]
    }
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_lb_listener_rule" "rewrite_dsaweb_30" {
  listener_arn = aws_alb_listener.apache-https-public.arn
  priority     = "30"

  action {
    type             = "redirect"
    redirect {
      #host            = #{host}
      path             = "/DSAWeb"
      port             = 443
      protocol         = "HTTPS"
      query            = "TYPE=true"
      status_code      = "HTTP_301"
    }
  }

 #   RewriteRule ^/DSAWeb/irdta$ https://%{SERVER_NAME}/DSAWeb/?TYPE=true    [R,L]
  condition {
    path_pattern {
    values = ["/DSAWeb/irdta"]
    }
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_lb_listener_rule" "rewrite_dsaweb_40" {
  listener_arn = aws_alb_listener.apache-https-public.arn
  priority     = "40"

  action {
    type             = "redirect"
    redirect {
      #host            = #{host}
      path             = "/DSAWeb/#{path}"
      port             = 443
      protocol         = "HTTPS"
      query            = ""
      status_code      = "HTTP_301"
    }
  }
 
 #   RewriteRule ^/irdtatb$      https://%{SERVER_NAME}/DSAWeb/irdtatb       [R,L]
  condition {
    path_pattern {
    values = ["/irdtatb"]
    }
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_lb_listener_rule" "rewrite_dsaweb_50" {
  listener_arn = aws_alb_listener.apache-https-public.arn
  priority     = "50"

  action {
    type             = "redirect"
    redirect {
      #host            = #{host}
      path             = "/DSAWeb/#{path}"
      port             = 443
      protocol         = "HTTPS"
      #query           = #{query}
      status_code      = "HTTP_301"
    }
  }

 #   RewriteRule ^/irdtatb/(.*)  https://%{SERVER_NAME}/DSAWeb/irdtatb/$1    [R,L]
  condition {
    path_pattern {
    values = ["/irdtatb/"]
    }
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_lb_listener_rule" "rewrite_dsaweb_60" {
  listener_arn = aws_alb_listener.apache-https-public.arn
  priority     = "60"

  action {
    type             = "redirect"
    redirect {
      #host            = #{host}
      path             = "/DSAWeb/#{path}"
      port             = 443
      protocol         = "HTTPS"
      #query           = #{query}
      status_code      = "HTTP_301"
    }
  }

 #   RewriteRule ^/irdtm$        https://%{SERVER_NAME}/DSAWeb/irdtm         [R,L]
  condition {
    path_pattern {
    values = ["/irdtm"]
    }
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_lb_listener_rule" "rewrite_dsaweb_70" {
  listener_arn = aws_alb_listener.apache-https-public.arn
  priority     = "70"

  action {
    type             = "redirect"
    redirect {
      #host            = #{host}
      path             = "/DSAWeb/#{path}"
      port             = 443
      protocol         = "HTTPS"
      #query           = #{query}
      status_code      = "HTTP_301"
    }
  }

 #   RewriteRule ^/irdtm/(.*)    https://%{SERVER_NAME}/DSAWeb/irdtm/$1      [R,L]
  condition {
    path_pattern {
    values = ["/irdtm/"]
    }
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_lb_listener_rule" "irdt_proxy" {
  #  ProxyPassReverse   "http://irdt-internal.opsdev.nonprod.tars.dev-dvsacloud.uk/DSAWeb"
  count        = contains(var.ibs1_ibs2_redirect_env, var.environment) ? 1 : 0
  listener_arn = aws_alb_listener.apache-https-public.arn
  priority     = "100"

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

resource "aws_lb_listener_rule" "rewrite_obsweb_80" {
  listener_arn = aws_alb_listener.apache-https-public.arn
  priority     = "80"

  action {
    type             = "redirect"
    redirect {
      #host            = #{host}
      path             = "/obs-web"
      port             = 443
      protocol         = "HTTPS"
      #query           = #{query}
      status_code      = "HTTP_301"
    }
  }

 #   RewriteRule ^/obs/(.*)  https://%{SERVER_NAME}/obs-web/$1 [R,L]
  condition {
    path_pattern {
    values = ["/obs/"]
    }
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_lb_listener_rule" "rewrite_obsweb_90" {
  listener_arn = aws_alb_listener.apache-https-public.arn
  priority     = "90"

  action {
    type             = "redirect"
    redirect {
      #host            = #{host}
      path             = "/obs-web/pages/home"
      port             = 443
      protocol         = "HTTPS"
      #query           = #{query}
      status_code      = "HTTP_301"
    }
  }

 #   RewriteRule ^/obs/(.*)  https://%{SERVER_NAME}/obs-web/$1 [R,L]
  condition {
    path_pattern {
    values = ["/obs"]
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
  priority     = "100"

  action {
    type             = "forward"
    target_group_arn = data.terraform_remote_state.apps.outputs.obs-tg-8080-arn
  }

  condition {
    path_pattern {
    values = ["/obs"]
    }
  }

  lifecycle {
    create_before_destroy = true
  }
}