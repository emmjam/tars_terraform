################################################################################
#
# RDS Parameter Groups
#
################################################################################

resource "aws_db_parameter_group" "db-t2-medium" {
  name = "${format(
    "%s-%s-%s-%s",
    var.project,
    var.component,
    var.environment,
    "db-t2-medium"
  )}"

  family = "oracle-se2-12.1"

  parameter {
    name         = "sqlnetora.sqlnet.expire_time"
    value        = "10"
    apply_method = "immediate"
  }

}

resource "aws_db_parameter_group" "db-r4-xlarge" {
  name = "${format(
    "%s-%s-%s-%s",
    var.project,
    var.component,
    var.environment,
    "db-r4-xlarge"
  )}"

  family = "oracle-se2-12.1"

  parameter {
    name         = "memory_max_target"
    value        = "0"
    apply_method = "pending-reboot"
  }

  parameter {
    name         = "memory_target"
    value        = "0"
    apply_method = "immediate"
  }

  parameter {
    name         = "pga_aggregate_target"
    value        = "3899392"
    apply_method = "immediate"
  }

  parameter {
    name         = "pga_aggregate_limit"
    value        = "9940992"
    apply_method = "pending-reboot"
  }

  parameter {
    name         = "shared_pool_reserved_size"
    value        = "126976"
    apply_method = "pending-reboot"
  }

  parameter {
    name         = "log_buffer"
    value        = "61865984"
    apply_method = "pending-reboot"
  }

  parameter {
    name         = "cpu_count"
    value        = "4"
    apply_method = "immediate"
  }

  parameter {
    name         = "dml_locks"
    value        = "21452"
    apply_method = "pending-reboot"
  }

  parameter {
    name         = "parallel_servers_target"
    value        = "64"
    apply_method = "immediate"
  }

  parameter {
    name         = "processes"
    value        = "3236"
    apply_method = "pending-reboot"
  }

  parameter {
    name         = "sessions"
    value        = "4876"
    apply_method = "pending-reboot"
  }

  parameter {
    name         = "transactions"
    value        = "5363"
    apply_method = "pending-reboot"
  }

  parameter {
    name         = "db_file_multiblock_read_count"
    value        = "128"
    apply_method = "immediate"
  }

  parameter {
    name         = "db_writer_processes"
    value        = "1"
    apply_method = "pending-reboot"
  }

  parameter {
    name         = "job_queue_processes"
    value        = "50"
    apply_method = "immediate"
  }

  parameter {
    name         = "session_cached_cursors"
    value        = "50"
    apply_method = "pending-reboot"
  }

  parameter {
    name         = "use_large_pages"
    value        = "ONLY"
    apply_method = "pending-reboot"
  }

  parameter {
    name         = "sqlnetora.sqlnet.expire_time"
    value        = "10"
    apply_method = "immediate"
  }

}

resource "aws_db_parameter_group" "db-r4-2xlarge" {
  name = "${format(
    "%s-%s-%s-%s",
    var.project,
    var.component,
    var.environment,
    "db-r4-2xlarge"
  )}"

  family = "oracle-se2-12.1"

  parameter {
    name         = "sga_max_size"
    value        = "47054848"
    apply_method = "pending-reboot"
  }

  parameter {
    name         = "sga_target"
    value        = "47054848"
    apply_method = "immediate"
  }

  parameter {
    name         = "memory_max_target"
    value        = "0"
    apply_method = "pending-reboot"
  }

  parameter {
    name         = "memory_target"
    value        = "0"
    apply_method = "immediate"
  }

  parameter {
    name         = "pga_aggregate_target"
    value        = "7834624"
    apply_method = "immediate"
  }

  parameter {
    name         = "pga_aggregate_limit"
    value        = "19977216"
    apply_method = "pending-reboot"
  }

  parameter {
    name         = "shared_pool_reserved_size"
    value        = "254976"
    apply_method = "pending-reboot"
  }

  parameter {
    name         = "log_buffer"
    value        = "125829120"
    apply_method = "pending-reboot"
  }

  parameter {
    name         = "cpu_count"
    value        = "8"
    apply_method = "immediate"
  }

  parameter {
    name         = "dml_locks"
    value        = "43012"
    apply_method = "pending-reboot"
  }

  parameter {
    name         = "parallel_servers_target"
    value        = "128"
    apply_method = "immediate"
  }

  parameter {
    name         = "processes"
    value        = "6503"
    apply_method = "pending-reboot"
  }

  parameter {
    name         = "sessions"
    value        = "9776"
    apply_method = "pending-reboot"
  }

  parameter {
    name         = "transactions"
    value        = "10753"
    apply_method = "pending-reboot"
  }

  parameter {
    name         = "db_file_multiblock_read_count"
    value        = "128"
    apply_method = "immediate"
  }

  parameter {
    name         = "db_writer_processes"
    value        = "1"
    apply_method = "pending-reboot"
  }

  parameter {
    name         = "job_queue_processes"
    value        = "50"
    apply_method = "immediate"
  }

  parameter {
    name         = "session_cached_cursors"
    value        = "50"
    apply_method = "pending-reboot"
  }

  parameter {
    name         = "use_large_pages"
    value        = "ONLY"
    apply_method = "pending-reboot"
  }

  parameter {
    name         = "sqlnetora.sqlnet.expire_time"
    value        = "10"
    apply_method = "immediate"
  }

}

resource "aws_db_parameter_group" "db-r4-4xlarge" {
  name = "${format(
    "%s-%s-%s-%s",
    var.project,
    var.component,
    var.environment,
    "db-r4-4xlarge"
  )}"

  family = "oracle-se2-12.1"

  parameter {
    name         = "sga_max_size"
    value        = "94371840"
    apply_method = "pending-reboot"
  }

  parameter {
    name         = "sga_target"
    value        = "94371840"
    apply_method = "immediate"
  }

  parameter {
    name         = "memory_max_target"
    value        = "0"
    apply_method = "pending-reboot"
  }

  parameter {
    name         = "memory_target"
    value        = "0"
    apply_method = "immediate"
  }

  parameter {
    name         = "pga_aggregate_target"
    value        = "15703040"
    apply_method = "immediate"
  }

  parameter {
    name         = "pga_aggregate_limit"
    value        = "40043520"
    apply_method = "pending-reboot"
  }

  parameter {
    name         = "shared_pool_reserved_size"
    value        = "510976"
    apply_method = "pending-reboot"
  }

  parameter {
    name         = "log_buffer"
    value        = "254803968"
    apply_method = "pending-reboot"
  }

  parameter {
    name         = "cpu_count"
    value        = "16"
    apply_method = "immediate"
  }

  parameter {
    name         = "dml_locks"
    value        = "86168"
    apply_method = "pending-reboot"
  }

  parameter {
    name         = "parallel_servers_target"
    value        = "256"
    apply_method = "immediate"
  }

  parameter {
    name         = "processes"
    value        = "13035"
    apply_method = "pending-reboot"
  }

  parameter {
    name         = "sessions"
    value        = "19584"
    apply_method = "pending-reboot"
  }

  parameter {
    name         = "transactions"
    value        = "21542"
    apply_method = "pending-reboot"
  }

  parameter {
    name         = "db_file_multiblock_read_count"
    value        = "128"
    apply_method = "immediate"
  }

  parameter {
    name         = "db_writer_processes"
    value        = "2"
    apply_method = "pending-reboot"
  }

  parameter {
    name         = "job_queue_processes"
    value        = "50"
    apply_method = "immediate"
  }

  parameter {
    name         = "session_cached_cursors"
    value        = "50"
    apply_method = "pending-reboot"
  }

  parameter {
    name         = "use_large_pages"
    value        = "ONLY"
    apply_method = "pending-reboot"
  }

  parameter {
    name         = "sqlnetora.sqlnet.expire_time"
    value        = "10"
    apply_method = "immediate"
  }

}


resource "aws_db_parameter_group" "db-m4-xlarge" {
  name = "${format(
    "%s-%s-%s-%s",
    var.project,
    var.component,
    var.environment,
    "db-m4-xlarge"
  )}"

  family = "oracle-se2-12.1"

  parameter {
    name         = "sga_max_size"
    value        = "12189696"
    apply_method = "pending-reboot"
  }

  parameter {
    name         = "sga_target"
    value        = "0"
    apply_method = "immediate"
  }

  parameter {
    name         = "memory_max_target"
    value        = "12482248704"
    apply_method = "pending-reboot"
  }

  parameter {
    name         = "memory_target"
    value        = "12482248704"
    apply_method = "immediate"
  }

  parameter {
    name         = "pga_aggregate_target"
    value        = "0"
    apply_method = "immediate"
  }

  parameter {
    name         = "pga_aggregate_limit"
    value        = "9764864"
    apply_method = "pending-reboot"
  }

  parameter {
    name         = "shared_pool_reserved_size"
    value        = "58368"
    apply_method = "pending-reboot"
  }

  parameter {
    name         = "log_buffer"
    value        = "29360128"
    apply_method = "pending-reboot"
  }

  parameter {
    name         = "cpu_count"
    value        = "4"
    apply_method = "immediate"
  }

  parameter {
    name         = "dml_locks"
    value        = "11208"
    apply_method = "pending-reboot"
  }

  parameter {
    name         = "parallel_servers_target"
    value        = "64"
    apply_method = "immediate"
  }

  parameter {
    name         = "processes"
    value        = "1683"
    apply_method = "pending-reboot"
  }

  parameter {
    name         = "sessions"
    value        = "2548"
    apply_method = "pending-reboot"
  }

  parameter {
    name         = "transactions"
    value        = "2802"
    apply_method = "pending-reboot"
  }

  parameter {
    name         = "db_file_multiblock_read_count"
    value        = "128"
    apply_method = "immediate"
  }

  parameter {
    name         = "db_writer_processes"
    value        = "1"
    apply_method = "pending-reboot"
  }

  parameter {
    name         = "job_queue_processes"
    value        = "50"
    apply_method = "immediate"
  }

  parameter {
    name         = "session_cached_cursors"
    value        = "50"
    apply_method = "pending-reboot"
  }

  parameter {
    name         = "use_large_pages"
    value        = "FALSE"
    apply_method = "pending-reboot"
  }

  parameter {
    name         = "sqlnetora.sqlnet.expire_time"
    value        = "10"
    apply_method = "immediate"
  }

  parameter {
    name         = "sqlnetora.sqlnet.expire_time"
    value        = "10"
    apply_method = "immediate"
  }

}

resource "aws_db_parameter_group" "db-m4-2xlarge" {
  name = "${format(
    "%s-%s-%s-%s",
    var.project,
    var.component,
    var.environment,
    "db-m4-2xlarge"
  )}"

  family = "oracle-se2-12.1"

  parameter {
    name         = "sga_max_size"
    value        = "24576000"
    apply_method = "pending-reboot"
  }

  parameter {
    name         = "sga_target"
    value        = "0"
    apply_method = "immediate"
  }

  parameter {
    name         = "memory_max_target"
    value        = "25165824000"
    apply_method = "pending-reboot"
  }

  parameter {
    name         = "memory_target"
    value        = "25165824000"
    apply_method = "immediate"
  }

  parameter {
    name         = "pga_aggregate_target"
    value        = "0"
    apply_method = "immediate"
  }

  parameter {
    name         = "pga_aggregate_limit"
    value        = "19660800"
    apply_method = "pending-reboot"
  }

  parameter {
    name         = "shared_pool_reserved_size"
    value        = "94208"
    apply_method = "pending-reboot"
  }

  parameter {
    name         = "log_buffer"
    value        = "60817408"
    apply_method = "pending-reboot"
  }

  parameter {
    name         = "cpu_count"
    value        = "8"
    apply_method = "immediate"
  }

  parameter {
    name         = "dml_locks"
    value        = "22528"
    apply_method = "pending-reboot"
  }

  parameter {
    name         = "parallel_servers_target"
    value        = "128"
    apply_method = "immediate"
  }

  parameter {
    name         = "processes"
    value        = "3397"
    apply_method = "pending-reboot"
  }

  parameter {
    name         = "sessions"
    value        = "5120"
    apply_method = "pending-reboot"
  }

  parameter {
    name         = "transactions"
    value        = "5632"
    apply_method = "pending-reboot"
  }

  parameter {
    name         = "db_file_multiblock_read_count"
    value        = "128"
    apply_method = "immediate"
  }

  parameter {
    name         = "db_writer_processes"
    value        = "1"
    apply_method = "pending-reboot"
  }

  parameter {
    name         = "job_queue_processes"
    value        = "50"
    apply_method = "immediate"
  }

  parameter {
    name         = "session_cached_cursors"
    value        = "50"
    apply_method = "pending-reboot"
  }

  parameter {
    name         = "use_large_pages"
    value        = "FALSE"
    apply_method = "pending-reboot"
  }

  parameter {
    name         = "sqlnetora.sqlnet.expire_time"
    value        = "10"
    apply_method = "immediate"
  }

}
