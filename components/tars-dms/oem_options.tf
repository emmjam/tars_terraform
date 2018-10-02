resource "aws_db_option_group" "dms_oem" {
  name                     = "dms-oem-option-group"
  option_group_description = "Terraform Option Group"
  engine_name              = "oracle-se2"
  major_engine_version     = "12.1"

  option {
    option_name = "OEM"

    port = "5500"
    vpc_security_group_memberships = ["${aws_security_group.dms-oem.id}"]
  }

}

resource "aws_db_parameter_group" "dms_oem" {
  name   = "dms-oem-pg"
  family = "oracle-se2-12.1"

  parameter {
    name         = "sqlnetora.sqlnet.inbound_connect_timeout"
    value        = "120"
    apply_method = "immediate"
  }

}

resource "aws_db_option_group" "tars_test" {
  name                     = "tars-test-option-group"
  option_group_description = "Terraform Option Group"
  engine_name              = "oracle-se2"
  major_engine_version     = "12.1"

  option {
    option_name = "OEM"

    port = "5500"
    vpc_security_group_memberships = ["${aws_security_group.dms-oem.id}"]
  }

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

resource "aws_db_option_group" "cpc_test" {
  name                     = "cpc-test-option-group"
  option_group_description = "Terraform Option Group"
  engine_name              = "oracle-se2"
  major_engine_version     = "12.1"

  option {
    option_name = "OEM"

    port = "5500"
    vpc_security_group_memberships = ["${aws_security_group.dms-oem.id}"]
  }

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

resource "aws_db_option_group" "mis_test" {
  name                     = "mis-test-option-group"
  option_group_description = "Terraform Option Group"
  engine_name              = "oracle-se2"
  major_engine_version     = "12.1"

  option {
    option_name = "OEM"

    port = "5500"
    vpc_security_group_memberships = ["${aws_security_group.dms-oem.id}"]
  }

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

resource "aws_db_option_group" "rsis_test" {
  name                     = "rsis-test-option-group"
  option_group_description = "Terraform Option Group"
  engine_name              = "oracle-se2"
  major_engine_version     = "12.1"

  option {
    option_name = "OEM"

    port = "5500"
    vpc_security_group_memberships = ["${aws_security_group.dms-oem.id}"]
  }

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
