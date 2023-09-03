#security greoup for server test-ec2
resource "aws_security_group" "test-sg" {
    name = "test-sg"
    vpc_id = aws_vpc.testvpc.id
  
ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
}

egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]

}

tags = {
    Name = "test-sg"
}
 
}
