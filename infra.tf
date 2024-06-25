# resource "jamfpro_smart_computer_group" "NEw" {
#   count = 25
#   name = "JL Computer Group NEW ${count.index}"
  
#   site_id = 1174
# }


# resource "jamfpro_advanced_computer_search" "test_search" {
#   count = 10
#   name = "Test name - ${count.index}"
#   # site_id = 1174
# }

resource "jamfpro_script" "scripts_0002" {
  count = 25
  name            = "Category Testing Script-home-${count.index}"
  script_contents = "hello world"
  os_requirements = "13.1"
  priority        = "BEFORE"
  info = "Your script info here."

}

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