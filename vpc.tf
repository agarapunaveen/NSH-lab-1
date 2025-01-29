# Create VPC
/*resource "aws_vpc" "main" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "main-vpc"
  }
} */

# Create Public Subnet
/* resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet"
  }
} */

# Create Private Subnets for RDS
/* resource "aws_subnet" "private_1" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.2.0/24"

  tags = {
    Name = "private-subnet-1"
  }
} */

/* resource "aws_subnet" "private_2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.3.0/24"

  tags = {
    Name = "private-subnet-2"
  }
} */

# Create Security Group for RDS
/* resource "aws_security_group" "rds" {
  name        = "rds_security_group"
  description = "Security group for RDS instance"
  vpc_id      = aws_vpc.main.id

  ingress {
    description     = "Allow MySQL traffic from EC2"
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    # security_groups = [aws_security_group.allow_ssh.id]
  } 

  tags = {
    Name = "rds-sg"
  }
} */


/* resource "aws_db_subnet_group" "default" {
  name        = "main-db-subnet-group-1"
  description = "Database subnet group"
  subnet_ids  = [aws_subnet.private_1.id, aws_subnet.private_2.id]

  tags = {
    Name = "main-db-subnet-group"
  }
} */

# Create DB Subnet Group


/* resource "aws_db_instance" "main" {
  identifier        = "main-db-instance"
  engine            = "mysql"
  engine_version    = "8.0"
  instance_class    = lookup(var.instance_class,terraform.workspace,"db.t3.micro")
  allocated_storage = lookup(var.allocated_storage,terraform.workspace,30)

  db_name  = "myappdb"
  username = "admin"
  password = "your-secure-password-here"  # In production, use AWS Secrets Manager

  db_subnet_group_name   = aws_db_subnet_group.default.name
  vpc_security_group_ids = [aws_security_group.rds.id]

  skip_final_snapshot = true  # For development only. Use false in production

  backup_retention_period = 7
  multi_az               = false  # Set to true for production
  storage_encrypted      = true

  tags = {
    Name = "main-db-instance"
  }
} */

/*module "vpc" {
source = "git::https://github.com/agarapunaveen/terraform.git?ref=master"
  comman_tags = var.comman_tags
  project_name = var.project_name
 aws_subnet_public = var.aws_subnet_public
  aws_subnet_private = var.aws_subnet_private
  aws_subnet_database = var.aws_subnet_database
  is_peering = var.is_peering
} */

resource "aws_default_vpc" "default" {
vpc_id=data.aws_vpc.default.id
}

# Create Security Group for RDS
/*resource "aws_security_group" "rds" {
  name        = "rds_security_group_1"
  description = "Security group for RDS instance"
  vpc_id      = data.aws_ssm_parameter.vpc_id.value

  ingress {
    description     = "Allow MySQL traffic from EC2"
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    # security_groups = [aws_security_group.allow_ssh.id]
  } 

  tags = {
    Name = "rds-sg"
  }
} */

# Create DB Subnet Group


 /*resource "aws_db_instance" "main" {
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
} */
