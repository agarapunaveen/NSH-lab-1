
 resource "aws_db_instance" "main" {
  identifier        = "main-db-instance"
  engine            = "mysql"
  engine_version    = "8.0"
  instance_class    = lookup(var.instance_class,terraform.workspace,"db.t3.micro")
  allocated_storage = lookup(var.allocated_storage,terraform.workspace,30)

  db_name  = "myappdb"
  username = "admin"
  password = "your-secure-password-here"  # In production, use AWS Secrets Manager

  /*db_subnet_group_name   = aws_db_subnet_group.default.name */
 /* vpc_security_group_ids = element(split(",",data.aws_ssm_parameter.public_subnet_ids.value),0) */

  skip_final_snapshot = true  # For development only. Use false in production

  backup_retention_period = 7
  multi_az               = false  # Set to true for production
  storage_encrypted      = true

  tags = {
    Name = "main-db-instance"
  }
} 
