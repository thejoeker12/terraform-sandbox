# resource "jamfpro_policy" "jamfpro_policy_script_example" {
#   name                          = "JL Testing"
#   enabled                       = false
#   trigger_checkin               = false

#   # network_limitations {
#   #   minimum_network_connection = "No Minimum"
#   #   any_ip_address             = false
#   # }

#   scope {
#     all_computers = false
#     all_jss_users = false
#   }

#   # self_service {
#   #   use_for_self_service            = true
#   #   self_service_display_name       = ""
#   #   install_button_text             = "Install"
#   #   self_service_description        = ""
#   #   force_users_to_view_description = false

#   #   feature_on_main_page = false
#   # }

#   payloads {
#     # packages {
#     #   distribution_point = "default" // Set the appropriate distribution point
#     #   package {
#     #     id                          = 367
#     #     action                      = "Cache" // The action to perform with the package (e.g., Install, Cache, etc.)
#     #     fill_user_template          = false     // Whether to fill the user template
#     #     fill_existing_user_template = false     // Whether to fill existing user templates
#     #   }
#     # }

#     # scripts {
#     #   id          = 7722
#     #   priority    = "After"
#     # }

#     # scripts {
#     #   id          = 7719
#     #   priority    = "After"
#     # }

#     # reboot {
#     # }

#   }

# }


# resource "jamfpro_category" "new_cat" {
#   count = 5
#   name = "100 Categories-1-${count.index}"
#   priority = 5
# }

# resource "jamfpro_building" "test" {
#   count = 10
#   name = "Test Number new name - ${count.index}"

# }