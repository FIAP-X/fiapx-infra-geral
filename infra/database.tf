resource "aws_db_subnet_group" "fiapx_subnet_group" {
  name       = "fiapx-subnet-group"
  subnet_ids = ["subnet-072294e19e1c05ea4", "subnet-00890da9b0ab1bb00"]
}

resource "aws_security_group" "fiapx_db_sg" {
  name        = "fiapx-db-sg"
  description = "Acesso ao RDS PostgreSQL"
  vpc_id      = "vpc-04c65ba98c63ff91f"

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_db_instance" "lanchonete_db_produto" {
  db_name             = "fiapx_db"
  identifier          = "fiapx-db"
  allocated_storage   = 20
  engine              = "mysql"
  engine_version      = "8.0.39"
  instance_class      = "db.t3.micro"
  username            = "root"
  password            = "root1234"
  skip_final_snapshot = true

  vpc_security_group_ids = [aws_security_group.fiapx_db_sg.id]
  db_subnet_group_name   = aws_db_subnet_group.fiapx_subnet_group.name
}