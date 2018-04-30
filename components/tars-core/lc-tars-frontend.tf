# Define the LC for the tars frontend core server
resource "aws_launch_configuration" "tars-frontend" {
  name_prefix = "${format(
    "%s-%s-%s-%s-",
    var.project,
    var.environment,
    var.component,
    "wf-front"
  )}"

  image_id             = "${data.aws_ami.wildfly-front.image_id}"
  instance_type        = "${var.wildfly-front_instance_type}"
  spot_price           = "${var.lc_spot_price}"
  key_name             = "${data.terraform_remote_state.acc.key_name}"
  user_data            = "${data.template_cloudinit_config.wildfly-front.rendered}"
  iam_instance_profile = "${data.terraform_remote_state.base.tars_core_iam_instance_profile_name}"

  security_groups = [
    "${aws_security_group.tars-core-frontend.id}",
    "${data.terraform_remote_state.base.core_sg_id}",
  ]

  lifecycle {
    create_before_destroy = true
  }
}
