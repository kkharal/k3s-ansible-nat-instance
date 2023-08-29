#VPC
resource "aws_vpc" "lcc-vpc" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_support   = var.k3s_enable_dns_support
  enable_dns_hostnames = var.k3s_enable_dns_hostname
  # enable_classiclink              = false

  tags = {
    Name = "${local.name}-vpc"
  }
}

# Subnets
# Internet Gateway for Public Subnet
resource "aws_internet_gateway" "ig" {
  vpc_id = aws_vpc.lcc-vpc.id
  tags = {
    Name = "${local.name}-igw"
  }
}

#Elastic-IP (eip) for NAT
resource "aws_eip" "nat_eip" {
  vpc        = true
  depends_on = [aws_internet_gateway.ig]
  tags = {
    Name = "${local.name}-vpn_eip"
  }
}

resource "aws_eip_association" "eip-association" {
  instance_id   = aws_instance.vpn[0].id
  allocation_id = aws_eip.nat_eip.id
}


# NAT
# resource "aws_nat_gateway" "nat" {
#   allocation_id = "${aws_eip.nat_eip.id}"
#   subnet_id     = "${element(aws_subnet.public-subnet.*.id, 0)}"

#   tags = {
#     Name = "${local.name}-nat"
#   }
# }

resource "aws_subnet" "public-subnet" {
  vpc_id                  = "${aws_vpc.lcc-vpc.id}"
  count                   = "${length(var.public_subnets_cidr)}"
  cidr_block              = "${element(var.public_subnets_cidr,   count.index)}"
  availability_zone       = "${element(var.availability_zones,   count.index)}"
  map_public_ip_on_launch = true

  tags = {
    Name = "${local.name}-public-subnet"
  }
}

resource "aws_subnet" "private-subnet" {
  vpc_id                  = "${aws_vpc.lcc-vpc.id}"
  count                   = "${length(var.private_subnets_cidr_blocks)}"
  cidr_block              = "${element(var.private_subnets_cidr_blocks, count.index)}"
  availability_zone       = "${element(var.availability_zones, count.index)}"
  map_public_ip_on_launch = false

  tags = {
    Name = "${local.name}-private-subnet"
  }
}

# Routing tables to route traffic for Private Subnet
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.lcc-vpc.id

  tags = {
    Name = "${local.name}-private-rtb"
  }
}

# Routing tables to route traffic for Public Subnet
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.lcc-vpc.id
  route  {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ig.id
  }
  tags = {
    Name = "${local.name}-public-rtb"
  }
}

# Route for NAT
resource "aws_route" "private_nat_gateway" {
  route_table_id         = aws_route_table.private.id
  destination_cidr_block = "0.0.0.0/0"
  #nat_gateway_id         = aws_nat_gateway.nat.id #we have to modify her like (instance_id = aws_instance_id)
  #network_interface_id   = aws_network_interface.nic.id
  instance_id            = aws_instance.nat_instance[0].id   
}

# Route table associations for both Public & Private Subnets
resource "aws_route_table_association" "public" {
  count          = "${length(var.public_subnets_cidr)}"
  subnet_id      = "${element(aws_subnet.public-subnet.*.id, count.index)}"
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "private" {
  count          = "${length(var.private_subnets_cidr_blocks)}"
  subnet_id      = "${element(aws_subnet.private-subnet.*.id, count.index)}"
  route_table_id = aws_route_table.private.id
}
