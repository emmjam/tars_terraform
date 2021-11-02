resource "aws_route53_record" "gitlab_amzn2" {
  name    = "gitlab"
  zone_id = data.terraform_remote_state.acc.outputs.public_domain_name_zone_id
  type    = "A"

  alias {
    name                   = module.gitlab-amzn2.public_elb_dns_name
    zone_id                = module.gitlab-amzn2.public_elb_zone_id
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "gitlab_upgrade" {
  name    = "gitlab_upgrade"
  zone_id = data.terraform_remote_state.acc.outputs.public_domain_name_zone_id
  type    = "A"

  alias {
    name                   = module.gitlab-upgrade.public_elb_dns_name
    zone_id                = module.gitlab-upgrade.public_elb_zone_id
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "jenkins" {
  name    = "jenkins"
  zone_id = data.terraform_remote_state.acc.outputs.public_domain_name_zone_id
  type    = "A"

  alias {
    name                   = aws_alb.public.dns_name
    zone_id                = aws_alb.public.zone_id
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "sonarqube" {
  name    = "sonarqube"
  zone_id = data.terraform_remote_state.acc.outputs.public_domain_name_zone_id
  type    = "A"

  alias {
    name                   = aws_alb.public.dns_name
    zone_id                = aws_alb.public.zone_id
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "nexus" {
  name    = "nexus"
  zone_id = data.terraform_remote_state.acc.outputs.public_domain_name_zone_id
  type    = "A"

  alias {
    name                   = aws_alb.public.dns_name
    zone_id                = aws_alb.public.zone_id
    evaluate_target_health = true
  }
}
