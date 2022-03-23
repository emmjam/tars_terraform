resource "aws_alb" "tars_core_public" {
  name = format("%s-%s", local.csi, "public")

  internal     = "false"
  idle_timeout = 300

  security_groups = [
    aws_security_group.tars_core_alb_public.id,
  ]

  subnets = data.terraform_remote_state.base.outputs.subnets_alb_public

  lifecycle {
    create_before_destroy = true
  }
  
  tags = merge(
    local.default_tags,
    {
      "Name" = format("%s/%s", local.csi, "public")
    },
  )
}

