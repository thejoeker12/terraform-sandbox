data "local_file" "config" {
  filename = "clientauth.json"
}

locals {
  config = jsondecode(data.local_file.config.content)
}


terraform {
  required_providers {
    jamfpro = {
      source  = "terraform.local/local/jamfpro"
      version = "0.1.0"
    }
  }
}


locals {
  json_data = jsondecode(file("/Users/joseph/github/terraform-sandbox/clientauth.json"))
}


provider "jamfpro" {
  instance_domain = "https://lbgsandbox.jamfcloud.com"
  auth_method     = "oauth2"
  client_id       = local.json_data.clientId
  client_secret   = local.json_data.clientSecret
  log_level       = "debug"
}




