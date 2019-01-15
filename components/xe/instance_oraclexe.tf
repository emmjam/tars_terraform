resource "aws_instance" "oraclexe" {
  ami                         = "${data.aws_ami.oraclexe.image_id}"
  instance_type               = "t2.micro"
  key_name                    = "${data.terraform_remote_state.acc.key_name}"
  iam_instance_profile        = "${aws_iam_instance_profile.oraclexe_profile.id}"
  associate_public_ip_address = false
  subnet_id                   = "${data.terraform_remote_state.base.subnets_tars_db[0]}"

  vpc_security_group_ids = [
    "${aws_security_group.oraclexe.id}",
    "${data.terraform_remote_state.base.core_sg_id}",
  ]

  tags = "${merge(
    local.default_tags,
    map(
      "Name", "${local.csi}-oraclexe"
    )
  )}"
}
