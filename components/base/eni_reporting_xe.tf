resource "aws_network_interface" "reporting_xe" {
  count             = var.reporting_xe_count
  subnet_id         = module.microservice_reporting_xe[count.index].subnet_ids[0]
  source_dest_check = "false"
  security_groups   = concat([module.microservice_reporting_xe[count.index].security_group_id], [aws_security_group.core.id])



  tags = merge(
    var.default_tags,
    {
      "Name" = format(
        "%s-%s-%s/%s",
        var.project,
        var.environment,
        var.component,
        "reporting-xe",
      )
      "Nodetype" = "reporting-xe"
      "Module"   = var.module
    },
  )
}
