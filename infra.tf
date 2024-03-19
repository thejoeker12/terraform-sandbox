
# resource "jamfpro_macos_configuration_profile" "Scope_Test2" {
#   name                = "Resource Testing-test"
#   distribution_method = "Install Automatically"
#   payload = file("payload.mobileconfig")
#   category {
#     id = -1
#   }
#   scope {
#     all_computers      = false
#     computer_ids       = sort([17, 18])
#     computer_group_ids = sort([53])
#     jss_user_ids       = [4]
#     jss_user_group_ids = [4]

#     exclusions {
#       department_ids     = [27653]
#     }
#   }
# }

# resource "jamfpro_department" "testdept" {
#   name = "the name"
# }