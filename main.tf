resource "aws_instance" "sandbox_ec2" {
  count = var.instance_count

  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_ids[count.index]
  vpc_security_group_ids = [var.security_group_id]
  key_name               = var.key_name

  user_data = <<-EOF
              #!/bin/bash
              apt-get update -y
              apt-get install -y unzip curl
              cd /tmp
              curl "https://amazonaws.com" -o "awscliv2.zip"
              unzip awscliv2.zip
              ./aws/install
              EOF

  user_data_replace_on_change = true

  tags = {
    Name = "sandbox-ec2-${count.index + 1}"
  }
}
