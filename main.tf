# Shared User Data script block
locals {
  user_data_script = <<-EOF
                     #!/bin/bash
                     apt-get update -y
                     apt-get install -y unzip curl
                     cd /tmp
                     curl "https://amazonaws.com" -o "awscliv2.zip"
                     unzip awscliv2.zip
                     ./aws/install
                     EOF
}

# 1. Public Subnet Instances
resource "aws_instance" "public_ec2" {
  count                  = var.public_instance_count
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_public_id
  vpc_security_group_ids = [var.security_group_id]
  key_name               = var.key_name
  user_data              = local.user_data_script

  user_data_replace_on_change = true
  tags = {
    Name = "sandbox-public-ec2-${count.index + 1}"
  }
}

# 2. Private Subnet Instances
resource "aws_instance" "private_ec2" {
  count                  = var.private_instance_count
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_private_id
  vpc_security_group_ids = [var.security_group_id]
  key_name               = var.key_name
  user_data              = local.user_data_script

  user_data_replace_on_change = true
  tags = {
    Name = "sandbox-private-ec2-${count.index + 1}"
  }
}

# 3. Isolated Subnet Instances
resource "aws_instance" "isolated_ec2" {
  count                  = var.isolated_instance_count
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_isolated_id
  vpc_security_group_ids = [var.security_group_id]
  key_name               = var.key_name
  user_data              = local.user_data_script

  user_data_replace_on_change = true
  tags = {
    Name = "sandbox-isolated-ec2-${count.index + 1}"
  }
}
