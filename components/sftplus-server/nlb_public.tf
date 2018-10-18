# sftplus Server public
resource "aws_lb" "sftpplus-svr-public" {
  name               = "${local.csi}-public"
  internal           = false
  load_balancer_type = "network"
  idle_timeout       = "300"

  # TODO: peacheym: Why?
  enable_deletion_protection = true

  subnet_mapping {
    subnet_id     = "${module.sftpplus_svr.subnet_ids[0]}"
    allocation_id = "${aws_eip.nlb_public.0.id}"
  }

  subnet_mapping {
    subnet_id     = "${module.sftpplus_svr.subnet_ids[1]}"
    allocation_id = "${aws_eip.nlb_public.1.id}"
  }

  subnet_mapping {
    subnet_id     = "${module.sftpplus_svr.subnet_ids[2]}"
    allocation_id = "${aws_eip.nlb_public.2.id}"
  }

  tags = "${merge(
    local.default_tags,
    map(
      "Name", "${local.csi}-public"
    )
  )}"
}
