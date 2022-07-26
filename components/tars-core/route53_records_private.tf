# Create the R53 record for the TARS DB
resource "aws_route53_record" "tarsdb" {
  name = format("%s-%s-%s", var.project, "core", "db")

  zone_id = data.terraform_remote_state.base.outputs.private_zone_id_aws
  type    = "A"

  alias {
    name                   = aws_db_instance.tarsdb.address
    zone_id                = aws_db_instance.tarsdb.hosted_zone_id
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "tarsdb_dvsacloud" {
  name = format("%s-%s-%s", var.project, "core", "db")

  zone_id = data.terraform_remote_state.base.outputs.private_zone_id
  type    = "A"

  alias {
    name                   = aws_db_instance.tarsdb.address
    zone_id                = aws_db_instance.tarsdb.hosted_zone_id
    evaluate_target_health = true
  }
}

# Create the R53 record for the TARS Backend ALB
resource "aws_route53_record" "tars-backend" {
  name = format("%s-%s-%s", var.project, "core", "backend")

  zone_id = data.terraform_remote_state.base.outputs.private_zone_id
  type    = "A"

  alias {
    name                   = aws_alb.tars-alb-backend-private.dns_name
    zone_id                = aws_alb.tars-alb-backend-private.zone_id
    evaluate_target_health = true
  }
}

# Create the R53 record for the TARS API ALB
resource "aws_route53_record" "tars-api" {
  name = format("%s-%s-%s", var.project, "core", "api")

  zone_id = data.terraform_remote_state.base.outputs.private_zone_id
  type    = "A"

  alias {
    name                   = aws_alb.tars-alb-backend-api.dns_name
    zone_id                = aws_alb.tars-alb-backend-api.zone_id
    evaluate_target_health = true
  }
}

# Create the R53 record for the TARS API ALB
resource "aws_route53_record" "tars-api-aws" {
  name = format("%s-%s-%s", var.project, "core", "api")

  zone_id = data.terraform_remote_state.base.outputs.private_zone_id_aws
  type    = "A"

  alias {
    name                   = aws_alb.tars-alb-backend-api.dns_name
    zone_id                = aws_alb.tars-alb-backend-api.zone_id
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "tars-private" {
  name = format("%s-%s-%s", var.project, "core", "private")

  zone_id = data.terraform_remote_state.base.outputs.private_zone_id
  type    = "A"

  alias {
    name                   = aws_alb.tars-private-facing.dns_name
    zone_id                = aws_alb.tars-private-facing.zone_id
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "pearsonssftp" {
  name    = "pearsonssftp"
  zone_id = data.terraform_remote_state.base.outputs.private_zone_id_aws
  type    = "CNAME"
  ttl     = "600"

  records = [
    "sftpuk2.pearsonvue.com",
  ]
}

resource "aws_route53_record" "pearsonssftp_dvsacloud" {
  name    = "pearsonssftp"
  zone_id = data.terraform_remote_state.base.outputs.private_zone_id
  type    = "CNAME"
  ttl     = "600"

  records = [
    "sftpuk2.pearsonvue.com",
  ]
}

