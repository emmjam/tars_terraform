#EIPs to allocate to the public NLB, one per AZ
resource "aws_eip" "nlb_public" {
  count = "${length(var.cpc_sftp_subnets_cidrs)}"
  vpc   = true
}
