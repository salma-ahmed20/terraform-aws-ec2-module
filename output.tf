output "eip_value" {
    description = "VMs Security Group"
    value= aws_instance.my-ec2.security_groups
}
