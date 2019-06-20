resource "aws_route53_zone" "ctrl" {
  name    = "${local.vpc_domain_name}"
  comment = "Private ${local.vpc_domain_name} hosted zone"

  vpc {
    vpc_region = "${var.aws_region}"
    vpc_id     = "${aws_vpc.ctrl.id}"
  }

  # See https://github.com/terraform-providers/terraform-provider-aws/issues/7805
  lifecycle {
    ignore_changes = ["vpc"]
  }

}
