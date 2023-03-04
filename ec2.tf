resource "aws_instance" "my-ec2"{
    ami="ami-0c0933ae5caf0f5f9"
    instance_type="t2.micro"

    tags = {
        Name = "salmaEc2Module"
    }
}

resource  "aws_eip" "my-eip"{
    vpc = true
}

resource "aws_eip_association" "associate"{
    instance_id=aws_instance.my-ec2.id
    allocation_id=aws_eip.my-eip.id

}

resource "aws_security_group" "sg" {
  name = "salma-sg"
  tags = {
    Name = "test-sg"
    type = "terraform-test-security-group"
  }
}

resource "aws_network_interface_sg_attachment" "sg_attachment" {
  security_group_id    = aws_security_group.sg.id
  network_interface_id = aws_instance.my-ec2.primary_network_interface_id
}