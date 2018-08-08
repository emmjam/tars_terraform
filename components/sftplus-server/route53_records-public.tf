# Create the R53 record for the public ALB
resource "aws_route53_record" "sftpplus_svr-public" {
  name = "sftp-cpc" # fixed address due to DVA requirements - means there can only be UAT in nonprod

  zone_id = "${data.terraform_remote_state.acc.public_domain_name_zone_id}"
  type    = "A"

  alias {
    name                   = "${aws_lb.sftpplus-svr-public.dns_name}"
    zone_id                = "${aws_lb.sftpplus-svr-public.zone_id}"
    evaluate_target_health = true
  }
}


