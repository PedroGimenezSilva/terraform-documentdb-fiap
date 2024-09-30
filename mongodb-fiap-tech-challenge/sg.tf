resource "aws_security_group" "documentdb_sg" {
  name        = "documentdb-sg"
  description = "Security group for DocumentDB"


  ingress {
    from_port   = 27017
    to_port     = 27017
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  
  }

    egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "DocumentDBSecurityGroup"
    provider = "terraform"
    cluster_name = "mongodb-fiap-tech-challenge"
  }
}