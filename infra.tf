# resource "jamfpro_smart_computer_group" "differe2ance" {
#   count = 100
#   name = "test-computer-group-${count.index}"

#   criteria {
#     name          = "Last Inventory Update"
#     priority      = 0
#     and_or        = "and"  # or "or", defaults to "and" if not provided
#     search_type   = "is"   # or any other supported search type
#     value         = "1"
#     opening_paren = false  # true or false, defaults to false if not provided
#     closing_paren = false  # true or false, defaults to false if not provided
#   }
# }


# resource "jamfpro_category" "category2" {
#   count = 1000
#   name = "tf-example-category-locked-cookie2-${count.index}"
#   priority = 1
# }


resource "jamfpro_policy" "policy_testing" {
    count = 100
    name = "policy-name-lock-test-${count.index}"
    enabled = true
    trigger_checkin = true
    frequency = "Once every day"

    category {
      id = 5
    }
    
    scope {
      all_computers = false
      all_jss_users = false
      computer_ids = sort([14, 19])
      department_ids = [37287]
      exclusions {
        computer_group_ids = sort([343])
      }
    }

    self_service {
      use_for_self_service = true
      self_service_display_name = "New Self Service Name"
      install_button_text = "NO"
      self_service_description = "New self service description"
      force_users_to_view_description = true
      feature_on_main_page = true
    }

  payloads {
    packages {
      id = 264
      fill_existing_user_template = true
    }

    scripts {
      id = 7486
      priority = "Before"
    }

    scripts {
      id = 7484
    }
  }

}