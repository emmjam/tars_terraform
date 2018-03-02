################################################################################
#
# RDS Parameter Group
#
################################################################################

# resource "aws_db_parameter_group" "tarsdb" {
#   name = "${format(
#     "%s-%s-%s-%s",
#     var.project,
#     var.environment,
#     var.component,
#     "tarsdb"
#   )}"

#   description = "${format(
#     "%s-%s-%s-%s",
#     var.project,
#     var.environment,
#     var.component,
#     "tarsdb"
#   )}"

#   family = "oracle-se2-12.1"

  # parameter {
  #   name         = "binlog_format"
  #   value        = "row"
  #   apply_method = "immediate"
  # }

  # parameter {
  #   name         = "innodb_file_format"
  #   value        = "barracuda"
  #   apply_method = "immediate"
  # }

  # parameter {
  #   name         = "innodb_io_capacity"
  #   value        = "5000"
  #   apply_method = "immediate"
  # }

  # parameter {
  #   name         = "innodb_log_file_size"
  #   value        = "536870912"
  #   apply_method = "pending-reboot"
  # }

  # parameter {
  #   name         = "innodb_open_files"
  #   value        = "15000"
  #   apply_method = "pending-reboot"
  # }

  # parameter {
  #   name         = "auto_increment_increment"
  #   value        = "2"
  #   apply_method = "immediate"
  # }

  # parameter {
  #   name         = "tmp_table_size"
  #   value        = "67108864"
  #   apply_method = "immediate"
  # }

  # parameter {
  #   name         = "sql_mode"
  #   value        = "strict_all_tables"
  #   apply_method = "immediate"
  # }

  # parameter {
  #   name         = "query_cache_limit"
  #   value        = "1048576"
  #   apply_method = "immediate"
  # }

  # parameter {
  #   name         = "query_cache_size"
  #   value        = "16777216"
  #   apply_method = "immediate"
  # }

  # parameter {
  #   name         = "max_allowed_packet"
  #   value        = "16777216"
  #   apply_method = "immediate"
  # }

  # parameter {
  #   name         = "log_output"
  #   value        = "file"
  #   apply_method = "immediate"
  # }

  # parameter {
  #   name         = "log_queries_not_using_indexes"
  #   value        = "0"
  #   apply_method = "immediate"
  # }

  # parameter {
  #   name         = "long_query_time"
  #   value        = "2"
  #   apply_method = "immediate"
  # }

  # parameter {
  #   name         = "log_bin_trust_function_creators"
  #   value        = "1"
  #   apply_method = "immediate"
  # }
# }
