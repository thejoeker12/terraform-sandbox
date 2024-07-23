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
  jamfpro_instance_fqdn      = "https://lbgsandbox.jamfcloud.com"
  auth_method                = "oauth2"
  client_id                  = local.json_data.clientId
  client_secret              = local.json_data.clientSecret
  enable_client_sdk_logs     = true
  client_sdk_log_export_path = "/Users/joseph/github/test.json"
  hide_sensitive_data        = true
  custom_cookies {
    name  = "cookie name"
    value = "cookie value"
  }
  jamfpro_load_balancer_lock           = true
  token_refresh_buffer_period_seconds  = 300
  mandatory_request_delay_milliseconds = 0

}




