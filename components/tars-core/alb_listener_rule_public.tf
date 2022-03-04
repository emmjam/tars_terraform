resource "aws_lb_listener_rule" "rewrite_dsaweb_1" {
  listener_arn = aws_alb_listener.apache-https-public.arn
  priority     = "5"

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

resource "aws_lb_listener_rule" "rewrite_dsaweb_2" {
  listener_arn = aws_alb_listener.apache-https-public.arn
  priority     = "10"

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

resource "aws_lb_listener_rule" "rewrite_dsaweb_3" {
  listener_arn = aws_alb_listener.apache-https-public.arn
  priority     = "15"

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

resource "aws_lb_listener_rule" "rewrite_dsaweb_4" {
  listener_arn = aws_alb_listener.apache-https-public.arn
  priority     = "20"

  action {
    type             = "redirect"
    redirect {
      #host            = #{host}
      path             = "/DSAWeb/irdtatb"
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

resource "aws_lb_listener_rule" "rewrite_dsaweb_5" {
  listener_arn = aws_alb_listener.apache-https-public.arn
  priority     = "25"

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

resource "aws_lb_listener_rule" "rewrite_dsaweb_6" {
  listener_arn = aws_alb_listener.apache-https-public.arn
  priority     = "30"

  action {
    type             = "redirect"
    redirect {
      #host            = #{host}
      path             = "/DSAWeb/irdtm"
      port             = 443
      protocol         = "HTTPS"
      query            = ""
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

resource "aws_lb_listener_rule" "rewrite_dsaweb_7" {
  listener_arn = aws_alb_listener.apache-https-public.arn
  priority     = "35"

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
  listener_arn = aws_alb_listener.apache-https-public.arn
  priority     = "40"

  action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.irdt-frontend2-7443.arn
  }

  condition {
    path_pattern {
    values = ["/DSAWeb/*"]
    }
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_lb_listener_rule" "rewrite_obsweb_1" {
  listener_arn = aws_alb_listener.apache-https-public.arn
  priority     = "45"

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

resource "aws_lb_listener_rule" "rewrite_obsweb_2" {
  listener_arn = aws_alb_listener.apache-https-public.arn
  priority     = "50"

  action {
    type             = "redirect"
    redirect {
      #host            = #{host}
      path             = "/obs-web/pages/home"
      port             = 443
      protocol         = "HTTPS"
      query            = ""
      status_code      = "HTTP_301"
    }
  }

 #   RewriteRule ^/obs$      https://%{SERVER_NAME}/obs-web/pages/home [R,L]
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
  listener_arn = aws_alb_listener.apache-https-public.arn
  priority     = "55"

  action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.obs2-8080.arn
  }

  condition {
    path_pattern {
    values = ["/obs-web/*"]
    }
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_lb_listener_rule" "rewrite_cpc_1" {
  listener_arn = aws_alb_listener.apache-https-public.arn
  priority     = "60"

  action {
    type             = "redirect"
    redirect {
      #host            = #{host}
      path             = "/cpctrain/delegatedTest"
      port             = 443
      protocol         = "HTTPS"
      query            = ""
      status_code      = "HTTP_301"
    }
  }

 #  RewriteRule ^/delegated$        https://%{SERVER_NAME}/cpctrain/delegatedTest    [R,L]
  condition {
    path_pattern {
    values = ["/delegated"]
    }
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_lb_listener_rule" "rewrite_cpc_2" {
  listener_arn = aws_alb_listener.apache-https-public.arn
  priority     = "65"

  action {
    type             = "redirect"
    redirect {
      #host            = #{host}
      path             = "/cpctrain/delegatedTest"
      port             = 443
      protocol         = "HTTPS"
      #query            = #{query}
      status_code      = "HTTP_301"
    }
  }

 #  RewriteRule ^/delegated/(.*)    https://%{SERVER_NAME}/cpctrain/delegatedTest/$1 [R,L]
  condition {
    path_pattern {
    values = ["/delegated/"]
    }
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_lb_listener_rule" "cpc_proxy1" {
  #  ProxyPassReverse   "http://cpc-internal.opsdev.nonprod.tars.dev-dvsacloud.uk/cpctrain"
  listener_arn = aws_alb_listener.apache-https-public.arn
  priority     = "70"

  action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.cpc2-9443.arn
  }

  condition {
    path_pattern {
    values = ["/cpctrain/*"]
    }
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_lb_listener_rule" "cpc_proxy2" {
  #  ProxyPassReverse   "http:////cpc-internal.opsdev.nonprod.tars.dev-dvsacloud.uk/cpcode"
  listener_arn = aws_alb_listener.apache-https-public.arn
  priority     = "75"

  action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.cpc2-9443.arn
  }

  condition {
    path_pattern {
    values = ["/cpcode/*"]
    }
  }

  lifecycle {
    create_before_destroy = true
  }
}