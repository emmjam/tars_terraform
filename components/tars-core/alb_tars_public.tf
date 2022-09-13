resource "aws_alb" "tars_alb_public" {
  name = format("%s-%s", local.csi, "public")

  internal     = "false"
  idle_timeout = 300

  security_groups = [
    aws_security_group.tars_alb_public.id,
  ]

  subnets = data.terraform_remote_state.base.outputs.subnets_alb_public

  tags = merge(
    local.default_tags,
    {
      "Name" = format("%s/%s", local.csi, "tars-public")
    },
  )
}

