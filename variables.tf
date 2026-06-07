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

# Change this value (1, 2, or 3) directly in your code to control deployment size
variable "instance_count" {
  type        = number
  default     = 1 
  description = "Number of instances to create (1, 2, or 3)"

  validation {
    condition     = var.instance_count >= 1 && var.instance_count <= 3
    error_message = "Sandbox limit reached. The instance_count must be exactly 1, 2, or 3."
  }
}

# This list accepts your ordered subnets passed from the GitHub Actions workflow
variable "subnet_ids" {
  type        = list(string)
  description = "Ordered list of sandbox subnet IDs passed from the workflow"
}

variable "security_group_id" {
  type        = string
  description = "The ID of your existing sandbox Security Group"
}

variable "key_name" {
  type        = string
  description = "The exact name of your pre-existing AWS Key Pair"
}
