#Create AWS VPC
resource "aws_vpc" "testvpc" {
    cidr_block = "10.50.0.0/16"
    instance_tenancy = "default"

    tags = {
      Name = "testvpc"
    }
    
}

#Public Subnet in testvpc

resource "aws_subnet" "test-public-subnet" {
  vpc_id = aws_vpc.testvpc.id
  cidr_block = "10.50.7.0/24"
  map_public_ip_on_launch = "true"
  availability_zone = "ap-south-1a"

  tags = {
    Name = "test-public-subnet"
  }


}


#Private Subnet in testvpc

resource "aws_subnet" "test-private-subnet" {
  vpc_id = aws_vpc.testvpc.id
  cidr_block = "10.50.9.0/24"
  map_public_ip_on_launch = "false"
  availability_zone = "ap-south-1b"

  tags = {
    Name = "test-private-subnet"
  }


}

#Custom internet Gateway
resource "aws_internet_gateway" "test-igw" {
    vpc_id = aws_vpc.testvpc.id

    tags = {
      Name = "test-igw"
    }
  
}

#Route table for Public subnet in testvpc

resource "aws_route_table" "test-public-rt" {
    vpc_id = aws_vpc.testvpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.test-igw.id

    }

    tags = {
      Name = "test-public-rt"
    }
  
}

#Route table for Private subnet in testvpc

resource "aws_route_table" "test-private-rt" {
    vpc_id = aws_vpc.testvpc.id
    

    tags = {
      Name = "test-private-rt"
    }
  
}


#Public subnet association with public route table 

resource "aws_route_table_association" "test-public-rt-assos" {
    subnet_id = aws_subnet.test-public-subnet.id
    route_table_id = aws_route_table.test-public-rt.id
  
}

#Private subnet association with private route table 

resource "aws_route_table_association" "test-private-rt-assos" {
    subnet_id = aws_subnet.test-private-subnet.id
    route_table_id = aws_route_table.test-private-rt.id
  
}
