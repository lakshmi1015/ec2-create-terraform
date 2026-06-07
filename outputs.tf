output "sandbox_instance_id" {
  value       = aws_instance.sandbox_ec2.id
  description = "The unique AWS ID assigned to the sandbox EC2 instance"
}

output "sandbox_instance_private_ip" {
  value       = aws_instance.sandbox_ec2.private_ip
  description = "The private IP address of the sandbox instance"
}
