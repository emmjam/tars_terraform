resource "aws_launch_template" "tars-mock" {
  name_prefix = "${local.csi}-wf-mock-"

  image_id      = data.aws_ami.wildfly-mock.image_id
  instance_type = var.wildfly-mock_instance_type
  key_name      = data.terraform_remote_state.acc.outputs.key_name
  user_data     = data.cloudinit_config.wildfly-mock.rendered

  instance_market_options {
    market_type = "spot"
    spot_options {
      max_price = var.spot_pricing[var.wildfly-mock_instance_type]
    }
  }

  block_device_mappings {
    device_name = "/dev/xvda"
    ebs {
      volume_size = 8
      volume_type = var.lc_volume_type
    }
  }

  vpc_security_group_ids = [
    aws_security_group.tars-mock.id,
    data.terraform_remote_state.base.outputs.core_sg_id,
  ]

  iam_instance_profile {
    name = data.terraform_remote_state.base.outputs.tars_core_iam_instance_profile_name
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
          "mock",
        )
        "Nodetype" = "mock"
      },
    )
  }
}
