output "app_public_ip" {
  value = aws_instance.app.public_ip
}

output "app_private_ip" {
  value = aws_instance.app.private_ip
}

output "rds_endpoint" {
  description = "Endpoint для підключення до RDS"
  value       = aws_db_instance.example.endpoint
}
