provider "aws" {
  region = "eu-west-1"
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

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
  owners = ["099720109477"]
}

resource "aws_instance" "this" {
  for_each                    = var.instances
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = each.value.instance_type
  associate_public_ip_address = true

  tags = merge(
    {
      "Name" : each.key
    }, each.value.tags
  )
}
