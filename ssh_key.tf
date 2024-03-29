#ssh
resource "tls_private_key" "ssh_key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

# Remove this block from ssh_key.tf
resource "aws_key_pair" "ec2_key_pair" {
  key_name   = "ec21-key"
  public_key = tls_private_key.ssh_key.public_key_openssh
}

resource "local_file" "private_key" {
  content  = tls_private_key.ssh_key.private_key_pem
  filename = "./private_key.pem"
}