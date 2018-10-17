#EIPs to allocate to the public NLB, one per AZ
resource "aws_eip" "nlb_public" {
  count = "${length(module.sftpplus_svr.subnet_ids)}"
  vpc   = true
}
