module "db" {
  source = "terraform-aws-modules/rds/aws"

  identifier = local.name

  engine               = "oracle-ee"
  engine_version       = "19"
  family               = "oracle-ee-19" 
  major_engine_version = "19"           
  instance_class       = "db.t3.small"
  license_model        = "bring-your-own-license"

  allocated_storage     = 10
  max_allocated_storage = 10


  db_name  = "ORACLE"
  username = "oracleadmin"
  port     = 1521

  multi_az               = true
  db_subnet_group_name   = module.vpc.database_subnet_group
  vpc_security_group_ids = [module.security_group.security_group_id]

  maintenance_window              = "Mon:00:00-Mon:03:00"
  backup_window                   = "03:00-06:00"
  enabled_cloudwatch_logs_exports = ["alert", "audit"]
  create_cloudwatch_log_group     = true

  backup_retention_period = 1
  skip_final_snapshot     = true
  deletion_protection     = false

  performance_insights_enabled          = true
  performance_insights_retention_period = 7
  create_monitoring_role                = true

  character_set_name       = "AL32UTF8"
  nchar_character_set_name = "AL16UTF16"

  tags = local.tags
}

module "db_disabled" {
  source = "terraform-aws-modules/rds/aws"

  identifier = "${local.name}-disabled"

  create_db_instance        = false
  create_db_parameter_group = false
  create_db_option_group    = false
}
