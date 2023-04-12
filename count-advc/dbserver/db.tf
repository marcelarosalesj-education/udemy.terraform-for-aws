variable "server_names"{
    type = list(string)
}

resource "aws_instance" "db" {
	ami = "ami-0fa1de1d60de6a97e"
	instance_type = "t2.micro"
    count = length(var.server_names)
    tags = {
        Name = var.server_names[count.index]
    }
}

output "db_private_ip" {
    value = [aws_instance.db.*.private_ip]
}