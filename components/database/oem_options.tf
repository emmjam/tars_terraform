resource "aws_db_option_group" "oem" {
  name                     = "oem-option-group"
  option_group_description = "Terraform Option Group"
  engine_name              = "oracle-se2"
  major_engine_version     = "12.1"

  option {
    option_name = "OEM"

    port = "5500"
    vpc_security_group_memberships = ["${aws_security_group.oem.id}"]
  }

}

resource "aws_db_parameter_group" "oem" {
  name   = "oem-pg"
  family = "oracle-se2-12.1"


}
