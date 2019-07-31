# Create LC for the TARS mock server
resource "aws_launch_configuration" "tars-mock" {
  name_prefix          = "${local.csi}-wf-mock-"
  image_id             = "${data.aws_ami.wildfly-mock.image_id}"
  instance_type        = "${var.wildfly-mock_instance_type}"
  spot_price           = "${lookup(var.rhel_spot_pricing, var.wildfly-mock_instance_type)}"
  key_name             = "${data.terraform_remote_state.acc.key_name}"
  user_data            = "${data.template_cloudinit_config.wildfly-mock.rendered}"
  iam_instance_profile = "${data.terraform_remote_state.base.tars_core_iam_instance_profile_name}"

  security_groups = [
    "${aws_security_group.tars-mock.id}",
    "${data.terraform_remote_state.base.core_sg_id}",
  ]

  lifecycle {
    create_before_destroy = true
  }
}
