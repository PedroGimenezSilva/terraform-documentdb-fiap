output "documentdb_password" {
  description = "The generated password for DocumentDB cluster"
  value       = random_password.documentdb_password.result
  sensitive = true

}

output "documentdb_cluster_endpoint" {
  value = aws_docdb_cluster.documentdb_cluster.endpoint
}