################################################################################
#
# Squid NAT Nodes
#
################################################################################

resource "aws_instance" "squidnat" {
  count         = "${length(var.subnets_cidrs)}"
  ami           = "${var.ami_id}"
  instance_type = "${var.instance_type}"

  vpc_security_group_ids = [
    "${aws_security_group.squidnat.id}",
    "${var.additional_sg_ids}",
  ]

  subnet_id = "${element(module.subnets.subnet_ids, count.index)}"

  source_dest_check           = "false"
  associate_public_ip_address = "true"

  # Commented out for reference as not known if required.
  user_data = "${data.template_file.squidnat_cloudinit_config.rendered}"

  tags = "${merge(
    var.default_tags,
    map(
      "Name", format(
        "%s-%s-%s/%s",
        var.project,
        var.environment,
        var.component,
        var.module
      ),
      "Nodetype", var.module,
      "Module", var.module
    )
  )}"
}
