
account_environment    = "nonprod"


##
# RDS
##

# TARSDB
tars_rds_username = "tarsdevadmin"
tars_rds_password = "password"

# TARSDB
tars_rds_allocated_storage   = "20" # 20 Gigabyte - was 1500GB
tars_rds_storage_type        = "gp2"
tars_rds_engine              = "oracle-se2"
tars_rds_engine_version      = "12.1.0.2.v11"
tars_rds_instance_class      = "db.t2.micro" # was "db.m4.4xlarge"
tars_rds_port                = "1521"
tars_rds_public              = "false"
tars_rds_multi_az            = "false" # it takes an age to build if true
tars_rds_backup_retention    = "0"
tars_rds_backup_window       = "02:38-03:08"
tars_rds_maint_window        = "sun:03:16-sun:03:46"
tars_rds_skip_final_snapshot = true
tars_rds_apply_immediately   = "true"
tars_rds_license_model       = "license-included"
tars_rds_snapshot            = "tars-testdb-210218"


