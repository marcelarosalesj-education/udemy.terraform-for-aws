provider "aws" {
	region = "us-east-1"
}

variable "number_of_servers" {
    type = number
}

resource "aws_instance" "ec2" {
	ami = "ami-0fa1de1d60de6a97e"
	instance_type = "t2.micro"
    count = var.number_of_servers
}
