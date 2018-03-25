# Define the LC for the tars backend core server
resource "aws_launch_configuration" "tars-backend" {
  name_prefix = "${format(
    "%s-%s-%s-%s-",
    var.project,
    var.environment,
    var.component,
    "wf-back"
  )}"

  image_id             = "${data.aws_ami.wildfly-back.image_id}"
  instance_type        = "${lookup(var.wildfly-back,"instance_type")}"
  spot_price           = "${var.lc_spot_price}"
  key_name             = "${data.terraform_remote_state.acc.key_name}"
  user_data            = "${data.template_cloudinit_config.wildfly-back.rendered}"
  iam_instance_profile = "${data.terraform_remote_state.base.tars_core_iam_instance_profile_name}"

  security_groups = ["${aws_security_group.tars-core-backend.id}"]

  lifecycle {
    create_before_destroy = true
  }
}
