# resource "jamfpro_static_computer_group" "jamfpro_static_computer_group_001" {
#   name = "Site testing"

#   # site_id = 1173
#   site_id = 1174

# }

resource "jamfpro_script" "scripts_0002" {
  name            = "Category Testing Script"
  script_contents = "hello world"
  os_requirements = "13.1"
  priority        = "BEFORE"
  info = "Your script info here."

}