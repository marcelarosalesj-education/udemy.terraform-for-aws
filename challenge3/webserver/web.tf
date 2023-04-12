variable "webname" {
	type = string
}

resource "aws_instance" "web" {
	ami = "ami-0fa1de1d60de6a97e"
	instance_type = "t2.micro"
    security_groups = [module.sg.sg_name]
    user_data = file("./webserver/server-script.sh")
    tags = {
        Name = var.webname
    }
}

output "pub_ip" {
    value = module.eip.web_public_ip
  
}

module "eip" {
    source = "../eip"
    instance_id =  aws_instance.web.id
}

module "sg" {
    source = "../sg"

}