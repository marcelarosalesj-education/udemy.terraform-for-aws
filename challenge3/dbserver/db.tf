variable "dbname" {
	type = string
}

resource "aws_instance" "db" {
	ami = "ami-0fa1de1d60de6a97e"
	instance_type = "t2.micro"
    tags = {
        Name = var.dbname
    }
}

output "db_private_ip" {
    value = aws_instance.db.private_ip
}