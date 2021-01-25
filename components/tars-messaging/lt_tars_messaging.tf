resource "aws_launch_template" "tars-messaging" {
  name_prefix = "${local.csi}-wf-messaging-"
  image_id      = data.aws_ami.wildfly-messaging.image_id
  instance_type = var.wildfly-messaging_instance_type
  user_data     = data.template_file.messaging.rendered
  key_name      = data.terraform_remote_state.acc.outputs.key_name

  vpc_security_group_ids = [
    aws_security_group.tars-messaging.id,
    data.terraform_remote_state.base.outputs.core_sg_id,
    aws_security_group.tars-messaging-ad.id,
  ]

  iam_instance_profile {
    name = data.terraform_remote_state.base.outputs.tars_messaging_iam_instance_profile_name
  }

  lifecycle {
    create_before_destroy = true
  }
}
