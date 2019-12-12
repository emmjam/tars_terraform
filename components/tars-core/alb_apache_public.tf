resource "aws_alb" "apache_public" {
  #"apache-public" hits 32 char limit
  name = format("%s-%s", local.csi, "apache")

  internal     = "false"
  idle_timeout = 300

  security_groups = [
    aws_security_group.apache_alb_public.id,
  ]

  subnets = data.terraform_remote_state.base.outputs.subnets_alb_public

  tags = merge(
    local.default_tags,
    {
      "Name" = format("%s/%s", local.csi, "apache-public")
    },
  )
}

