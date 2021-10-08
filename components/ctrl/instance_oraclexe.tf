resource "aws_instance" "oraclexe" {
  count                                 = var.account_environment != "mgmt" ? 1 : 0
  ami                                   = data.aws_ami.oraclexe.image_id
  instance_type                         = "t2.medium"
  iam_instance_profile                  = aws_iam_instance_profile.oraclexe_profile[count.index].id
  associate_public_ip_address           = true
  subnet_id                             = module.oraclexe_subnets.subnet_ids[0]

  vpc_security_group_ids = [
    aws_security_group.oraclexe[count.index].id,
    aws_security_group.outbound-oracle.id,
  ]

  root_block_device {
    volume_size = 40
    volume_type = "gp3"
  }

  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.csi}-oraclexe"
    },
  )
}

