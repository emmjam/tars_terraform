resource "aws_db_option_group" "cpc_oem" {
  name = "${format(
    "%s-%s-%s-%s",
    var.project,
    var.component,
    var.environment,
    "option-group"
  )}"
  option_group_description = "Terraform Option Group"
  engine_name              = "oracle-se2"
  major_engine_version     = "12.1"

  option {
    option_name = "OEM"

    port = "5500"
    vpc_security_group_memberships = ["${aws_security_group.cpc-oem.id}"]
  }

}
