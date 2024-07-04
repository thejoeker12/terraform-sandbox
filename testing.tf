

# variable "global_name_prefix" {
#     type = string
#     default = "Jl-Testing"

# }



# resource "jamfpro_api_integration" "jamfpro_api_integration_001" {
#   display_name                    = "${var.global_name_prefix}-apiintegration-1"
#   enabled                         = true
#   access_token_lifetime_seconds   = 7200
#   authorization_scopes            = [jamfpro_api_role.jamfpro_api_role_002.display_name]
# }

# resource "jamfpro_api_role" "jamfpro_api_role_002" {
#   display_name = "${var.global_name_prefix}-apirole-1"
#   privileges   = ["Create API Roles", "Update API Roles", "Read API Roles", "Delete API Roles"]
# }


# data "jamfpro_api_integration" "Testing" {
#     id = jamfpro_api_integration.jamfpro_api_integration_001.id
# }

# output "test2" {
#   value = data.jamfpro_api_integration.Testing.client_id
# }

# output "test3" {
#   value = data.jamfpro_api_integration.Testing.client_secret
# }