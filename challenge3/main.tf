provider "aws" {
	region = "us-east-1"
}

module "dbmodule" {
    source = "./dbserver"
    dbname = "DB Server Challenge 3"
}

module "webmodule" {
    source = "./webserver"
    webname = "Web Server Challenge 3"
}

output "PrivateIP" {
    value = module.dbmodule.db_private_ip
}

output "PublicIP" {
    value = module.webmodule.pub_ip
}