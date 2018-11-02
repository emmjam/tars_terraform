resource "aws_alb" "apache_public" {
  
  #"apache-public" hits 32 char limit
  name = "${format(
    "%s-%s",
    local.csi,
    "apache"
  )}"

  internal = "false"

  security_groups = [
    "${aws_security_group.apache_alb_public.id}",
  ]

  subnets = [
    "${data.terraform_remote_state.base.subnets_alb_public}",
  ]

  tags = "${merge(
    local.default_tags,
    map(
      "Name", format(
        "%s/%s",
        local.csi,
        "apache-public"
      ),
    )
  )}"
}
