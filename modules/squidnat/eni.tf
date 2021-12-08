resource "aws_network_interface" "squid" {
  count = length(var.subnets_cidrs)
  subnet_id = element(
    [
      module.microservice_squidnat_0.subnet_ids[0],
      module.microservice_squidnat_1.subnet_ids[0],
      module.microservice_squidnat_2.subnet_ids[0],
    ],
    count.index,
  )

  source_dest_check = "false"
  security_groups = concat(tolist([aws_security_group.squidnat.id]), var.additional_sg_ids)

  tags = merge(
    var.default_tags,
    {
      "Name" = format(
        "%s-%s-%s/%s",
        var.project,
        var.environment,
        var.component,
        var.module,
      )
      "Nodetype" = var.module
      "Module"   = var.module
    },
  )
}

