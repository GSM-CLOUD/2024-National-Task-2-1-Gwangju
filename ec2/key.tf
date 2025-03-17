resource "tls_private_key" "ec2-key" {
    algorithm = "RSA"
    rsa_bits = 2048

}

resource "aws_key_pair" "ec2-key-pair" {
  key_name = "${var.prefix}-key"
  public_key = tls_private_key.ec2-key.public_key_openssh
}

resource "local_file" "ec2_private_key" {
  content = tls_private_key.ec2-key.private_key_pem
  filename = "${path.module}/ec2_key.pem"
}
