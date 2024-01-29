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

provider "jamfpro" {
  instance_name = local.config.instanceName
  client_id     = local.config.clientId
  client_secret = local.config.clientSecret
  log_level     = "debug" # or "debug", "info", "none" depending on the desired verbosity of the http client
}







