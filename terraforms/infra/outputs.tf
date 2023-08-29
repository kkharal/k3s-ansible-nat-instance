output "vpn_ip" {
  value = aws_eip.nat_eip.public_ip
}

output "master" {
  value = aws_instance.master.*.private_ip 
}

output "master_ip" {
  value = {ip = aws_instance.master.*.private_ip }
}
output "worker_ip" {
  value = { ip = aws_instance.worker.*.private_ip }
}
output "master_id" {
  value = aws_instance.master.*.id
}

output "worker" {
  value = aws_instance.worker.*.private_ip 
}

output "worker_id" {
  value = aws_instance.worker.*.id
}

output "nat_instance" {
  value = aws_instance.nat_instance.*.public_ip
}

output "private_subnet" {
  value = aws_subnet.private-subnet.*.id
}

output "public_subnet" {
  value = aws_subnet.public-subnet.*.id
}

output "vpc_selected" {
  value = aws_vpc.lcc-vpc.id
}

# output "public_ip" {
#   value = aws_eip.nat_eip.public_ip
# }


output "external_lb_dns" {
  value = aws_lb.external-lb.dns_name
}

