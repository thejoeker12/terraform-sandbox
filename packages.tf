# resource "jamfpro_package" "jamfpro_package_001" {
#   package_name          = "googlechrome-jl"
#   package_file_source   = "/Users/josephlittle/Github/packages/googlechrome.dmg"
#   category_id           = "-1" // jamfpro_category.jamfpro_category_001.id
#   info                  = "tf package deployment for demonstration"
#   notes                 = "Uploaded by: terraform-provider-jamfpro plugin."
#   priority              = 10
#   reboot_required       = true
#   fill_user_template    = false
#   fill_existing_users   = false
#   os_requirements       = "macOS 10.15.7, macOS 11.1"
#   swu                   = true
#   self_heal_notify      = false
#   os_install            = false
#   serial_number         = ""
#   suppress_updates      = false
#   ignore_conflicts      = false
#   suppress_from_dock    = false
#   suppress_eula         = false
#   suppress_registration = false
#   manifest              = ""
#   manifest_file_name    = ""
# }

# resource "jamfpro_package" "jamfpro_package_002" {
#   package_name          = "sus_package.dmg"
#   package_file_source   = "/Users/josephlittle/Github/packages/sus_package.dmg"
#   category_id           = "-1" // jamfpro_category.jamfpro_category_001.id
#   info                  = "tf package deployment for demonstration"
#   notes                 = "Uploaded by: terraform-provider-jamfpro plugin."
#   priority              = 10
#   reboot_required       = true
#   fill_user_template    = false
#   fill_existing_users   = false
#   os_requirements       = "macOS 10.15.7, macOS 11.1"
#   swu                   = true
#   self_heal_notify      = false
#   os_install            = false
#   serial_number         = ""
#   suppress_updates      = false
#   ignore_conflicts      = false
#   suppress_from_dock    = false
#   suppress_eula         = false
#   suppress_registration = false
#   manifest              = ""
#   manifest_file_name    = ""
# }
