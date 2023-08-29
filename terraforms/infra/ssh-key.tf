# Creating a New Key
resource "aws_key_pair" "provisioner_key" {
  key_name   = "${local.name}-key"
  public_key = file("${var.public_key_path}")
  
  tags = {
    Name = "${local.name}-key"
  }
}
