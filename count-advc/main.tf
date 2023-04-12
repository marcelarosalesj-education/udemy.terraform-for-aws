provider "aws" {
    region = "us-east-1"
}

module "db" {
    source = "./dbserver"
    server_names = ["mariadb", "mysql", "mssql"]
}

output "private_ips" {
    value = module.db.db_private_ip
}