provider "aws" {
  region     = "us-east-1"
}

data "aws_ami" "the_ami" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-16.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "scalr" {
  ami                    = "${data.aws_ami.the_ami.id}"
  instance_type          = "t2.nano"
  subnet_id              = "subnet-0ebb1058ad727cfdb"
  vpc_security_group_ids = ["sg-0880cfdc546b123ba"]
  key_name               = "ryan"
}
