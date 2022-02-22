resource "aws_lb_listener_rule" "rewrite_dsaweb_1" {
  count        = contains(var.ibs1_ibs2_redirect_env, var.environment) ? 1 : 0
  listener_arn = aws_alb.apache_public.arn
  priority     = "101"

  action {
    type             = "redirect"
    #host            = #{host}
    path             = "/DSAWeb"
    port             = 443
    protocol         = "https"
    query            = "TYPE=true"
    status_code      = "301"
  }

 #   RewriteRule ^/irdta$        https://%{SERVER_NAME}/DSAWeb/?TYPE=true    [R,L]
 #   RewriteRule ^/DSAWeb/irdta$ https://%{SERVER_NAME}/DSAWeb/?TYPE=true    [R,L]

  condition {
    path_pattern {
    values = ["/irdta"]
    }
  }

  condition {
    path_pattern {
    values = ["/DSAWeb/irdta"]
    }
  }
}

resource "aws_lb_listener_rule" "rewrite_dsaweb_2" {
  count        = contains(var.ibs1_ibs2_redirect_env, var.environment) ? 1 : 0
  listener_arn = aws_alb.apache_public.arn
  priority     = "105"

  action {
    type             = "redirect"
    #host            = #{host}
    path             = "/DSAWeb/#{path}"
    port             = 443
    protocol         = "https"
    query            = ""
    status_code      = "301"
  }

 #   RewriteRule ^/irdtm$        https://%{SERVER_NAME}/DSAWeb/irdtm         [R,L]
 #   RewriteRule ^/irdtatb$      https://%{SERVER_NAME}/DSAWeb/irdtatb       [R,L]

  condition {
    path_pattern {
    values = ["/irdtm"]
    }
  }

  condition {
    path_pattern {
    values = ["/irdtatb"]
    }
  }
}

resource "aws_lb_listener_rule" "rewrite_dsaweb_3" {
  count        = contains(var.ibs1_ibs2_redirect_env, var.environment) ? 1 : 0
  listener_arn = aws_alb.apache_public.arn
  priority     = "107"

  action {
    type             = "redirect"
    #host            = #{host}
    path             = "/DSAWeb/#{path}"
    port             = 443
    protocol         = "https"
    #query            = #{query}
    status_code      = "301"
  }

 #   RewriteRule ^/irdta/(.*)    https://%{SERVER_NAME}/DSAWeb/irdta/$1      [R,L]
 #   RewriteRule ^/irdtm/(.*)    https://%{SERVER_NAME}/DSAWeb/irdtm/$1      [R,L]
 #   RewriteRule ^/irdtatb/(.*)  https://%{SERVER_NAME}/DSAWeb/irdtatb/$1    [R,L]

  condition {
    path_pattern {
    values = ["/irdta/"]
    }
  }

  condition {
    path_pattern {
    values = ["/irdtm/"]
    }
  }

    condition {
    path_pattern {
    values = ["/irdtatb/"]
    }
  }
}




    
resource "aws_lb_listener_rule" "apache-proxy-drop-in" {
  count        = contains(var.ibs1_ibs2_redirect_env, var.environment) ? 1 : 0
  listener_arn = aws_alb.apache_public.arn
  priority     = "106"

  action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.tars-public-80[0].arn
  }

  condition {
    path_pattern {
    values = ["/DSAWeb"]
    }
  }
}