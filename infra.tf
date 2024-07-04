# resource "jamfpro_static_computer_group" "jamfpro_static_computer_group_newlogger" {
#   name = "Flattened Test_newlogger"
#   assigned_computer_ids = [16]

# }

# resource "jamfpro_category" "example_category_newlogger" {
#   name = "Anoteher name_newlogger"
#   priority = 1
# }

# resource "jamfpro_script" "scripts_newlogger" {
#   name            = "tf-example-script-inline_newlogger-home"
#   script_contents = "hello world"
#   os_requirements = "13.1"
#   priority        = "BEFORE"
#   info = "Your script info here."
#   notes = ""
#   category_id = jamfpro_category.example_category_newlogger.id

# }

# resource "jamfpro_account_group"  "jamf_pro_account_group_002" {
#   name         = "jl testing"
#   access_level = "Full Access" // Full Access / Site Access / Group Access
#   privilege_set = "Custom" 

#   jss_objects_privileges = [
#     "Create Advanced Computer Searches",
#     "Read Advanced Computer Searches",
#     "Update Advanced Computer Searches",
#     "Delete Advanced Computer Searches",
#     "Create Advanced Mobile Device Searches",
#     "Read Advanced Mobile Device Searches",
#     "Update Advanced Mobile Device Searches",
#     "Delete Advanced Mobile Device Searches",
#     "Create Advanced User Searches",
#     "Read Advanced User Searches",
#     "Update Advanced User Searches",
#     "Delete Advanced User Searches",
#     "Create Advanced User Content Searches",
#     "Read Advanced User Content Searches",
#     "Update Advanced User Content Searches",
#     "Delete Advanced User Content Searches",
#     "Create AirPlay Permissions",
#     "Read AirPlay Permissions",
#     "Update AirPlay Permissions",
#     "Delete AirPlay Permissions",
#   ]

# }

resource "jamfpro_policy" "jamfpro_policy_script_example" {
  name                          = "tf-localtest-policy-script-example"
  enabled                       = false
  trigger_checkin               = false
  trigger_enrollment_complete   = false
  trigger_login                 = false
  trigger_network_state_changed = false
  trigger_startup               = false
  trigger_other                 = "EVENT" // "USER_INITIATED" for self service trigger , "EVENT" for an event trigger
  frequency                     = "Once per computer"
  retry_event                   = "none"
  retry_attempts                = -1
  notify_on_each_failed_retry   = false
  target_drive                  = "/"
  offline                       = false
  category_id                   = -1
  site_id                       = -1

  network_limitations {
    minimum_network_connection = "No Minimum"
    any_ip_address             = false
  }

  scope {
    all_computers = false
    all_jss_users = false
  }

  self_service {
    use_for_self_service            = true
    self_service_display_name       = ""
    install_button_text             = "Install"
    self_service_description        = ""
    force_users_to_view_description = false

    feature_on_main_page = false
  }

  payloads {

    scripts {
      id          = 7722
      priority    = "After"
      parameter4  = "param_value_4"
      parameter5  = "param_value_5"
      parameter6  = "param_value_6"
      parameter7  = "param_value_7"
      parameter8  = "param_value_8"
      parameter9  = "param_value_9"
      parameter10 = "param_value_10"
      parameter11 = "param_value_11"

    }
    scripts {
      id          = 7719
      priority    = "After"
      parameter4  = "param_value_4"
      parameter5  = "param_value_5"
      parameter6  = "param_value_6"
      parameter7  = "param_value_7"
      parameter8  = "param_value_8"
      parameter9  = "param_value_9"
      parameter10 = "param_value_10"
      parameter11 = "param_value_11"
    }


  }

}