resource "aws_instance" "oemproxy" {
  tags = "${merge(
    var.default_tags,
    map(
      "Name", format(
        "%s-%s-%s/%s",
        var.project,
        var.environment,
        var.component,
        "oemproxy" 
      ),
      "Component", var.component
    )
  )}"

  key_name                = "deployer"
  ami                     = "${data.aws_ami.amazon_linux.id}"
  instance_type           = "t2.micro"
  private_ip              = "10.10.0.36"

  root_block_device {
    volume_size = "8"
    volume_type = "gp2"
  }

  subnet_id = "${module.oemproxysubnet.subnet_ids[0]}"

  vpc_security_group_ids = [
    "${aws_security_group.oemproxy.id}",
  ]

  iam_instance_profile = ""
  user_data            = ""
}
