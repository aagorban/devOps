output "app" {
  value = aws_instance.app_instance.public_ip
}

output "jenkins-master" {
  value = aws_instance.jenkins_master.public_ip

}
output "jenkins-worker" {
  value = aws_instance.jenkins_worker.public_ip
}
