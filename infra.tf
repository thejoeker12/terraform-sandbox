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

resource "jamfpro_account_group"  "jamf_pro_account_group_002" {
  name         = "jl testing"
  access_level = "Full Access" // Full Access / Site Access / Group Access
  privilege_set = "Custom" 

  jss_objects_privileges = [
    "Create Advanced Computer Searches",
    "Read Advanced Computer Searches",
    "Update Advanced Computer Searches",
    "Delete Advanced Computer Searches",
    "Create Advanced Mobile Device Searches",
    "Read Advanced Mobile Device Searches",
    "Update Advanced Mobile Device Searches",
    "Delete Advanced Mobile Device Searches",
    "Create Advanced User Searches",
    "Read Advanced User Searches",
    "Update Advanced User Searches",
    "Delete Advanced User Searches",
    "Create Advanced User Content Searches",
    "Read Advanced User Content Searches",
    "Update Advanced User Content Searches",
    "Delete Advanced User Content Searches",
    "Create AirPlay Permissions",
    "Read AirPlay Permissions",
    "Update AirPlay Permissions",
    "Delete AirPlay Permissions",
  ]
  
}