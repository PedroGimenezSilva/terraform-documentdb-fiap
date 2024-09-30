resource "random_password" "documentdb_password" {
  length           = 16
  special          = true  
  override_special = "%@!" 
}

resource "aws_docdb_cluster_parameter_group" "disabled_tls" {
  name        = "my-docdb-parameter-group"
  family      = "docdb5.0" 
  description = "Parameter group for DocumentDB with TLS disabled"

  parameter {
    name  = "tls"
    value = "disabled"
  }
}


resource "aws_docdb_cluster" "documentdb_cluster" {
  cluster_identifier      = "mongodb-fiap-tech-challenge"
  engine                  = "docdb"
  master_username         = "fiap"
  master_password         = random_password.documentdb_password.result
  backup_retention_period = 1
  vpc_security_group_ids  = [aws_security_group.documentdb_sg.id]
  db_cluster_parameter_group_name = aws_docdb_cluster_parameter_group.disabled_tls.name
  skip_final_snapshot = true 
  tags = {
    provider = "terraform"
    cluster_name = "mongodb-fiap-tech-challenge"
  }
}


resource "aws_docdb_cluster_instance" "documentdb_instance" {
  count                = 1  
  identifier           = "documentdb-instance-1"
  cluster_identifier   = aws_docdb_cluster.documentdb_cluster.id
  instance_class       = "db.t3.medium"
  apply_immediately    = true
  engine               = "docdb"

  tags = {
    Name = "documentdb-instance-1"
    provider = "terraform"
    cluster_name = "mongodb-fiap-tech-challenge"
  }
}