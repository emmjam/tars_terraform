# sftplus Server internal
resource "aws_lb" "sftpplus-svr-private" {
  name     = "${local.csi}-cpc"
  internal = true

  subnets = module.sftpplus_svr.subnet_ids

  load_balancer_type = "network"
  idle_timeout       = "300"

  # TODO: peacheym:
  # Is this necessary? Are we protecting public IP assignments?
  # If it's necessary to prevent terraform from being able to
  # destroy something it created, shouldn't it use EIPs instead?
  # Deletion protection is generally reserved for snowflakes
  # such as production databases.
  enable_deletion_protection = true

  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.csi}-cpc"
    },
  )
}

