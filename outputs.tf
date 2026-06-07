output "sandbox_deployment_summary" {
  description = "Matrix of all active nodes running in the sandbox environment"
  value = {
    public_nodes = [
      for idx, inst in aws_instance.public_ec2 : {
        id          = inst.id
        private_ip  = inst.private_ip
        public_ip   = inst.public_ip != "" ? inst.public_ip : "N/A"
        public_dns  = inst.public_dns != "" ? inst.public_dns : "N/A"
      }
    ]
    private_nodes = [
      for idx, inst in aws_instance.private_ec2 : {
        id          = inst.id
        private_ip  = inst.private_ip
      }
    ]
    isolated_nodes = [
      for idx, inst in aws_instance.isolated_ec2 : {
        id          = inst.id
        private_ip  = inst.private_ip
      }
    ]
  }
}
