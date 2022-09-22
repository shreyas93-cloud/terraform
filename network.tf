resource "aws_internet_gateway" "terraformigw" {
  vpc_id = aws_vpc.terraformvpc.id
  tags = {
    Name = "MyTerraformIGW"
  }
}

resource "aws_route_table" "terraformRT" {
  vpc_id = aws_vpc.terraformvpc.id

  route {
    cidr_block = "0.0.0.0/0"

    gateway_id = aws_internet_gateway.terraformigw.id
  }
  tags = {
    Name = "MyTerraformRoute"
  }
}

resource "aws_route_table_association" "terraformRTA" {
  subnet_id      = aws_subnet.terraformsubnet1.id
  route_table_id = aws_route_table.terraformRT.id
}
