
module "hackathon" {
  source                                       = "./hackathon"
  jamfpro_client_id                            = var.jamfpro_client_id
  jamfpro_client_secret                        = var.jamfpro_client_secret
  jamfpro_auth_method                          = var.jamfpro_auth_method
  jamfpro_custom_cookies                       = var.jamfpro_custom_cookies
  jamfpro_hide_sensitive_data                  = var.jamfpro_hide_sensitive_data
  jamfpro_instance_fqdn                        = var.jamfpro_instance_fqdn
  jamfpro_load_balancer_lock                   = var.jamfpro_load_balancer_lock
  jamfpro_mandatory_request_delay_milliseconds = var.jamfpro_mandatory_request_delay_milliseconds
  jamfpro_token_refresh_buffer_period_seconds  = var.jamfpro_token_refresh_buffer_period_seconds
}