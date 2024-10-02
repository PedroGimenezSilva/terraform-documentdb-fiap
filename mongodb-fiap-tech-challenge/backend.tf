terraform {
  backend "s3" {
    bucket         = "fiap-terraform-state-bucket"  
    key            = "documentdb/mongodb-fiap-tech-challenge-parameter-group/terraform.tfstate"     
    region         = "us-east-1"  
                  
  }
}
