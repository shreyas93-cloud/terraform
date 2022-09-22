resource "aws_vpc" "terraformvpc" {
  cidr_block           = "10.1.0.0/16"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  instance_tenancy     = "default"

  tags = {
    Name = "MyTerraformVPC"
  }
}
resource "aws_subnet" "terraformsubnet1" {
  vpc_id                  = aws_vpc.terraformvpc.id
  cidr_block              = "10.1.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "us-east-1a"

  tags = {
    Name = "MyTerraformSubnet1"
  }
}
