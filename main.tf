resource "aws_instance" "test-ec2" {
    ami = lookup(var.ami, var.AWS_REGION)
    instance_type = var.inst-type
    #key_name = aws_key_pair.test-key-pair.key_name
    key_name = "kops-new"

    vpc_security_group_ids = [aws_security_group.test-sg.id]
    subnet_id = aws_subnet.test-public-subnet.id
  
}
