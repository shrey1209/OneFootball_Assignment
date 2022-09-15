provider "aws" {
  region = "eu-central-1"
  access_key = var.access_key
  secret_key = var.secret_key
}

locals {
  tag = var.server_type
}
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "k8s-server" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  availability_zone = "eu-central-1a"

  tags = {
    Name = local.tag
  }
}

resource "aws_ebs_volume" "k8s-volume" {
  availability_zone = "eu-central-1a"
  size              = 8

  tags = {
    Name = "${local.tag}_volume"
  }
}

resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.k8s-volume.id
  instance_id = aws_instance.k8s-server.id
}

