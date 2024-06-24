# resource "jamfpro_static_computer_group" "jamfpro_static_computer_group_001" {
#   name = "Site testing"

#   # site_id = 1173
#   site_id = 1174

# }





resource "jamfpro_script" "scripts_0001" {
  name            = "something else-1"
  script_contents = "hello world"
  # category_id = 5
  priority        = "BEFORE"
  info = "some script info"
}











# resource "jamfpro_script" "scripts_0002" {
#   name            = "Category Testing Script-cleanuptest-2"
#   script_contents = "hello world"
#   os_requirements = "13.1"
#   priority        = "BEFORE"
#   info = "Your script info here."
#   timeouts {
#     create = "50m"
#   }

# }

# resource "jamfpro_script" "scripts_0003" {
#   name            = "Category Testing Script-cleanuptest-3"
#   script_contents = "hello world"
#   os_requirements = "13.1"
#   priority        = "BEFORE"
#   info = "Your script info here."

# }

# resource "jamfpro_script" "scripts_0004" {
#   name            = "Category Testing Script-cleanuptest-4"
#   script_contents = "hello world"
#   os_requirements = "13.1"
#   priority        = "BEFORE"
#   info = "Your script info here."

# }