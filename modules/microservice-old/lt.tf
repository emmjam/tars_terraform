resource "aws_launch_template" "main" {
  name_prefix = format(
    "%s-%s-%s-%s-",
    var.project,
    var.environment,
    var.component,
    var.name,
  )

  image_id               = var.lc_ami_id
  instance_type          = var.lc_instance_type
  user_data              = base64encode(var.lc_user_data)
  vpc_security_group_ids = concat(tolist([aws_security_group.main.id]), var.lc_additional_sg_ids)
  key_name             = var.lc_key_name

  dynamic "instance_market_options" {
    for_each = var.lc_spot_price != "" ? [1] : []
    content {
      market_type = "spot"

      dynamic "spot_options" {
        for_each = var.lc_spot_price != "" ? [1] : []
            content {
                max_price = var.lc_spot_price
            }
      }
    }
  }

  block_device_mappings {
    device_name = "/dev/xvda"
      ebs {
        volume_size = var.lc_ebs_size
        volume_type = var.lc_volume_type
      }
  }

  iam_instance_profile {
    name = aws_iam_instance_profile.main.id
  }

  lifecycle {
    create_before_destroy = true
  }

  tag_specifications {
    resource_type = "volume"

    tags = merge(
      var.default_tags,
      {
        "Name" = format(
        "%s-%s-%s/%s",
        var.project,
        var.environment,
        var.component,
        var.name,
        )
        "Module" = var.module
        "Nodetype" = var.name
      },
    )
  }
}
