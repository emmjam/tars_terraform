
resource "aws_instance" "oraclexe" {
  ami           = "${data.aws_ami.oraclexe.image_id}"
  instance_type = "t2.micro"
  key_name             = "${data.terraform_remote_state.acc.key_name}"
  iam_instance_profile = "OracleXE"
  associate_public_ip_address = true
  subnet_id = "${module.subnets_rds.subnet_ids[0]}"

  vpc_security_group_ids = [
    "${aws_security_group.oraclexe.id}",
    "${data.terraform_remote_state.base.core_sg_id}",
  ]


  tags = "${merge(
    var.default_tags,
    map(
      "Name", format(
        "%s-%s-%s/%s",
        var.project,
        var.environment,
        var.component,
        "oraclexe"
      ),
    )
  )}"
}