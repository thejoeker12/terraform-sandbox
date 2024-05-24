
# resource "jamfpro_policy" "policy_testing" {
#     name = file("policy_name.txt")
#     enabled = true
#     trigger_checkin = true
#     frequency = "Once every day"
#     category {
#       id = 5
#     }
#     scope {
#       all_computers = false
#       all_jss_users = false
#       computer_ids = sort([15, 16])
#       department_ids = [37287]
#       exclusions {
#         computer_group_ids = sort([78])
#       }
#     }

#     self_service {
#       use_for_self_service = true
#       self_service_display_name = "New Self Service Name"
#       install_button_text = "YES"
#       self_service_description = "New self service description"
#       force_users_to_view_description = true
#       feature_on_main_page = true
#     }

#   payloads {
#     packages {
#       id = 232
#       fill_existing_user_template = true
#     }
#     packages {
#       id = 233
#     }


#     scripts {
#       id = 7268
#       priority = "Before"
#     }

#     scripts {
#       id = 7486
#     }
#   }

# }

resource "jamfpro_computer_group" "differe2ance" {
  name = file("group_name.txt")
  is_smart = false  # Set to true if the group is a Smart group, otherwise set to false

  # criteria {
  #   name          = "Last Inventory Update"
  #   priority      = 0
  #   and_or        = "and"  # or "or", defaults to "and" if not provided
  #   search_type   = "is"   # or any other supported search type
  #   value         = "Criterion Value"
  #   opening_paren = false  # true or false, defaults to false if not provided
  #   closing_paren = false  # true or false, defaults to false if not provided
  # }

  computers {
    id = 16
  }
}
