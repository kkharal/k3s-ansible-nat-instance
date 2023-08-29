# Creating a Security Group for webserver
resource "aws_security_group" "sg" {

  description = "Default security group to allow inbound/outbound from the VPC"
  name        = "${local.name}-sg"
  vpc_id      = aws_vpc.lcc-vpc.id
  depends_on = [aws_vpc.lcc-vpc]
  
ingress {
    from_port = "0"
    to_port   = "0"
    protocol  = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    self      = true
  }
  
  egress {
    from_port = "0"
    to_port   = "0"
    protocol  = "-1"
    self      = true
    cidr_blocks = ["0.0.0.0/0"]

  }
  tags = {
    Name = "${local.name}-sg"
  }
}
