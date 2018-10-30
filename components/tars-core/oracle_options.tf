resource "aws_db_option_group" "tars_core" {
  # TODO: peacheym: CSI was corrupt at creation
  #                 with component and environment the
  #                 wrong way around. Fix to use:
  # name = "${local.csi}-tz-option-group"

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
  }

}
