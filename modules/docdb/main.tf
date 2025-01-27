resource "aws_docdb_cluster" "docdb" {
  cluster_identifier      = "my-docdb-cluster"
  engine                  = "docdb"
  master_username         = "docdb"
  master_password         = "roboshop123"
  backup_retention_period = 2
  preferred_backup_window = "07:00-09:00"
  skip_final_snapshot     = true
  db_cluster_parameter_group_name = aws_docdb_cluster_parameter_group.pg.id
  vpc_security_group_ids = [aws_security_group.security_group.id]
}
resource "aws_docdb_cluster_parameter_group" "pg" {
  family = "docdb3.6"
  name   = "pg"
}
resource "aws_docdb_subnet_group" "subnet_group" {
  name       = "${var.component}-${var.env}-sg"
  subnet_ids = var.subnets
  tags = {
    Name = "${var.component}-${var.env}-sg"
  }
}
resource "aws_docdb_cluster_instance" "cluster_instances" {
  count              = var.instance_count
  identifier         = "docdb-cluster-demo-${count.index}"
  cluster_identifier = aws_docdb_cluster.docdb.id
  instance_class     = var.instance_class
  tags = {
    Name = "${var.component}-${var.env}-cluster-i"
  }
}
resource "aws_security_group" "security_group" {
  ingress {
    from_port = 27017
    to_port   = 27017
    protocol = "TCP"
    cidr_blocks = var.server_app_port_cidr
  }
  egress {
    from_port = 0
    to_port   = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
