resource "aws_db_option_group" "mis-19c" {
  name = format(
    "%s-%s-%s-%s",
    var.project,
    "mis-reporting",
    var.environment,
    "option-group-19c",
  )

  option_group_description = "Terraform Option Group"
  engine_name              = "oracle-se2"
  major_engine_version     = "19"

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
  option_name = "S3_INTEGRATION"
  version     = "1.0"
  }

  option {
    option_name = "SQLT"
  }
 
  option {
    option_name = "SSL"
    option_settings {
      name  = "SQLNET.SSL_VERSION"
      value = "1.2"
    }
    port                           = "2484"
    vpc_security_group_memberships = [aws_security_group.tars-mis-db.id]
  }
}

