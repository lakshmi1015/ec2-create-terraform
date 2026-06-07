variable "aws_region" {
  type        = string
  default     = "us-east-1"
  description = "The target AWS region for deployment"
}

variable "ami_id" {
  type        = string
  default     = "ami-0c7217cdde317cfec" 
  description = "The AMI ID to use for the EC2 instance"
}

variable "instance_type" {
  type        = string
  default     = "t2.micro"
  description = "The size of the EC2 instance"
}

# --- Independent Subnet Counts (Max 2 Each) ---

variable "public_instance_count" {
  type        = number
  default     = 1
  description = "Number of instances in the public subnet (0 to 2)"
  validation {
    condition     = var.public_instance_count >= 0 && var.public_instance_count <= 2
    error_message = "Sandbox limit reached: public_instance_count must be between 0 and 2."
  }
}

variable "private_instance_count" {
  type        = number
  default     = 0
  description = "Number of instances in the private subnet (0 to 2)"
  validation {
    condition     = var.private_instance_count >= 0 && var.private_instance_count <= 2
    error_message = "Sandbox limit reached: private_instance_count must be between 0 and 2."
  }
}

variable "isolated_instance_count" {
  type        = number
  default     = 0
  description = "Number of instances in the isolated subnet (0 to 2)"
  validation {
    condition     = var.isolated_instance_count >= 0 && var.isolated_instance_count <= 2
    error_message = "Sandbox limit reached: isolated_instance_count must be between 0 and 2."
  }
}

# --- Networking Secrets ---

variable "subnet_public_id" {
  type        = string
  description = "The public subnet ID"
}

variable "subnet_private_id" {
  type        = string
  description = "The private subnet ID"
}

variable "subnet_isolated_id" {
  type        = string
  description = "The isolated subnet ID"
}

variable "security_group_id" {
  type        = string
  description = "The ID of your existing sandbox Security Group"
}

variable "key_name" {
  type        = string
  description = "The exact name of your pre-existing AWS Key Pair"
}
