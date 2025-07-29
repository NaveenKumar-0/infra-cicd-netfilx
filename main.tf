provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "server" {
  count                  = length(var.instance_names)
  instance_type          = "t2.micro"
  ami                    = "ami-0f918f7e67a3323f0"
  vpc_security_group_ids = ["sg-07705d0dd20f52d04"]
  key_name               = "myfirstec2"
  tags = {
    Name = var.instance_names[count.index]
  }
}

variable "instance_names" {
  default = ["jenkins", "nexus", "svm1cdc", "svm1bdc", "ProGraph"]
}
