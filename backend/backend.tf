terraform {
    backend "s3" {
        key = "terraform/tfstate.tfstate"
        bucket = "mr-remote-backend-2023"
        region = "us-east-1"
        access_key = ""
        secret_key = ""
    }
}
