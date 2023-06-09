variable "instance_id" {
    type = string
}

resource "aws_eip" "web_ip" {
    instance = var.instance_id
}

output "web_public_ip" {
    value = aws_eip.web_ip.public_ip
}