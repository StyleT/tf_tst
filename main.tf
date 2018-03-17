variable "aws_access_key" {}
variable "aws_secret_key" {}

# Configure the AWS Provider
provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region     = "us-west-1"
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-trusty-14.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "web" {
  ami           = "${data.aws_ami.ubuntu.id}"
  instance_type = "t2.micro"

  tags {
    Name = "HelloWorld"
    app = "tfe"
  }
  security_groups = ["sg-9ee5e1f0"]
}

resource "null_resource" "cluster_new2" {
  # Changes to any instance of the cluster requires re-provisioning
  triggers = {}

}

resource "null_resource" "cluster_new1" {
  # Changes to any instance of the cluster requires re-provisioning
  triggers = {
    zzz = "tst"
  }

}