resource "aws_db_option_group" "tars_mis_timezone" {
  name = "${format(
    "%s-%s-%s-%s",
    var.project,
    var.component,
    var.environment,
    "tz-option-group"
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
}

resource "aws_db_option_group" "tars_rsis_timezone" {
  name = "${format(
    "%s-%s-%s-%s",
    var.project,
    var.component,
    var.environment,
    "tz-option-group"
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
}
