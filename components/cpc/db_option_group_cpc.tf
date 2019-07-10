resource "aws_db_option_group" "cpcdb" {
  name                     = "${local.csi}-option-group"
  option_group_description = "Terraform Option Group"
  engine_name              = "oracle-se2"
  major_engine_version     = "12.1"

  option {
    option_name = "Timezone"

    option_settings {
      name  = "TIME_ZONE"
      value = "Europe/London"
    }
  }

  option {
    option_name = "STATSPACK"
  }

  option {
    option_name = "SQLT"
    version = "2016-04-29.v1"
  }
}
