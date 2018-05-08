# LC for the messaging server
resource "aws_launch_configuration" "tars-messaging" {
  name_prefix = "${format(
    "%s-%s-%s-%s-",
    var.project,
    var.environment,
    var.component,
    "wf-messaging"
  )}"

  image_id             = "${data.aws_ami.wildfly-messaging.image_id}"
  instance_type        = "${var.wildfly-messaging_instance_type}"
  spot_price           = "${var.lc_spot_price}"
  key_name             = "${data.terraform_remote_state.acc.key_name}"
  # user_data            = "${data.template_cloudinit_config.wildfly-batch.rendered}"
  iam_instance_profile = "${data.terraform_remote_state.base.tars_messaging_iam_instance_profile_name}"

  security_groups = [
    "${aws_security_group.tars-messaging.id}",
    "${data.terraform_remote_state.base.core_sg_id}",
  ]

  lifecycle {
    create_before_destroy = true
  }
  # Debugging
  # associate_public_ip_address = true 
}
