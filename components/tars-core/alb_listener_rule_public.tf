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
      port             = 4433
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

resource "aws_lb_listener_rule" "apache-proxy-drop-in" {
  count        = contains(var.ibs1_ibs2_redirect_env, var.environment) ? 1 : 0
  listener_arn = aws_alb_listener.apache-https-public.arn
  priority     = "100"

  action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.tarspub80.arn
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