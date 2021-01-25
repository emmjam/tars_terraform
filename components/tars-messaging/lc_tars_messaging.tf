# LC for the messaging server
resource "aws_launch_configuration" "tars-messaging" {
  name_prefix          = "${local.csi}-wf-messaging-"
  image_id             = data.aws_ami.wildfly-messaging.image_id
  instance_type        = var.wildfly-messaging_instance_type
  spot_price           = var.lc_spot_price
  key_name             = data.terraform_remote_state.acc.outputs.key_name
  user_data            = data.template_file.messaging.rendered
  iam_instance_profile = data.terraform_remote_state.base.outputs.tars_messaging_iam_instance_profile_name

  security_groups = [
    aws_security_group.tars-messaging.id,
    data.terraform_remote_state.base.outputs.core_sg_id,
    aws_security_group.tars-messaging-ad.id,
  ]

  lifecycle {
    create_before_destroy = true
  }
  # Debugging
  #associate_public_ip_address = true
}
