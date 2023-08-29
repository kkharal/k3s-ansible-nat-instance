#Deployment for nat_instance
resource "aws_instance" "nat_instance" {
  ami                    = var.nat_instance
  source_dest_check      = false
  instance_type          = var.nat_instance_size
  key_name               = aws_key_pair.provisioner_key.key_name
  # key_name = "aws-key"
  count                  = var.nat_count
  subnet_id              = "${element(aws_subnet.public-subnet.*.id, count.index)}"
  availability_zone      = element(var.availability_zones, count.index)
  vpc_security_group_ids = [aws_security_group.sg.id]
  #user_data              = file("${var.installation_api}")

  tags = {
    Name = "${local.name}-nat-instance-${count.index + 1}"
  }
}

#Deployment for worker nodes
resource "aws_instance" "worker" {
  ami                    = var.ami
  instance_type          = var.worker_size
  key_name               = aws_key_pair.provisioner_key.key_name
  # key_name = "aws-key"
  count                  = var.worker_count
  subnet_id              = "${element(aws_subnet.private-subnet.*.id, count.index)}"
  availability_zone      = element(var.availability_zones, count.index)
  vpc_security_group_ids = [aws_security_group.sg.id]
  # user_data              = file("${var.installation_api}")

  tags = {
    Name = "${local.name}-worker-node-${count.index + 1}"
  }
}

#Deployment for master nodes
resource "aws_instance" "master" {
  ami                    = var.ami
  instance_type          = var.master_size
  key_name               = aws_key_pair.provisioner_key.key_name
  # key_name = "aws-key"
  count                  = var.master_count
  subnet_id              = "${element(aws_subnet.private-subnet.*.id, count.index)}"
  availability_zone      = element(var.availability_zones, count.index)
  vpc_security_group_ids = [aws_security_group.sg.id]
  # user_data              = file("${var.installation_api}")

  tags = {
    Name = "${local.name}-master-node-${count.index + 1}"
  }
}


#Deploying a single vpn server
resource "aws_instance" "vpn" {
  ami                    = var.ami
  instance_type          = var.vpn_instance_size
  key_name               = aws_key_pair.provisioner_key.key_name
  # key_name = "aws-key"
  count                  = var.vpn_count
  subnet_id      		 = "${element(aws_subnet.public-subnet.*.id, count.index)}" 
  availability_zone      = element(var.availability_zones, count.index)
  vpc_security_group_ids = [aws_security_group.sg.id]
  #user_data              = file("${var.installation_api}")

  tags = {
    Name = "${local.name}-vpn-svr-${count.index + 1}"
  }
}
