# Create the R53 record for the XE box
resource "aws_route53_record" "oraclexe" {
  name    = "oraclexe"
  zone_id = data.terraform_remote_state.base.outputs.private_zone_id
  type    = "A"
  ttl     = "60"

  records = [
    aws_instance.oraclexe.private_ip,
  ]
}

