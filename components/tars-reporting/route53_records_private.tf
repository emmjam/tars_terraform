# Create the R53 record for the MIS DB

resource "aws_route53_record" "misdb" {
  name    = "tars-mis-db"
  zone_id = data.terraform_remote_state.base.outputs.private_zone_id
  type    = "A"

  alias {
    name                   = aws_db_instance.misdb.address
    zone_id                = aws_db_instance.misdb.hosted_zone_id
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "rsisdb" {
  name    = "tars-rsis-db"
  zone_id = data.terraform_remote_state.base.outputs.private_zone_id
  type    = "A"

  alias {
    name                   = aws_db_instance.rsisdb.address
    zone_id                = aws_db_instance.rsisdb.hosted_zone_id
    evaluate_target_health = true
  }
}

