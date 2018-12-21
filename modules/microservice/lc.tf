# Create launch configration
resource "aws_launch_configuration" "main" {
  name_prefix = "${format(
    "%s/%s-",
    local.csi,
    var.name
  )}"

  image_id      = "${var.lc_ami_id}"
  instance_type = "${var.lc_instance_type}"

  security_groups = [
    "${aws_security_group.main.id}",
    "${var.lc_additional_sg_ids}",
  ]

  iam_instance_profile = "${aws_iam_instance_profile.main.id}"
  user_data            = "${var.lc_user_data}"

  lifecycle {
    create_before_destroy = true
  }
}
