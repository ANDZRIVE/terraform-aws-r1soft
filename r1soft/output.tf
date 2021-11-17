output "hosted_adress" {
  value = aws_instance.r1soft.public_ip
}

output "r1soft_username" {
  value = "admin"
}

output "r1soft_password" {
  value = "redhat"
}