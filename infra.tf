# resource "jamfpro_static_computer_group" "jamfpro_static_computer_group_001" {
#   name = "Site testing"

#   # site_id = 1173
#   site_id = 1174

# }





# resource "jamfpro_script" "scripts_0001" {
#   count = 25
#   name            = "Script Volume Test ${count.index}"
#   script_contents = "hello world"
#   category_id = 5
#   priority        = "BEFORE"
#   info = "some script info"
# }


resource "jamfpro_smart_computer_group" "NEw" {
  count = 25
  name = "JL Computer Group NEW ${count.index}"
  
  # Optional: Specify site details 
  site_id = 1174

  # Optional: Define criteria for Smart groups
  # criteria {
  #   name          = "Criterion Name #1"
  #   priority      = 0      # 0 is the highest priority, 1 is the next highest, etc.
  #   and_or        = "and"  # or "or", defaults to "and" if not provided
  #   search_type   = "is"   # or any other supported search type
  #   value         = "Criterion Value"
  #   opening_paren = false  # true or false, defaults to false if not provided
  #   closing_paren = false  # true or false, defaults to false if not provided
  # }

  # criteria {
  #   name          = "Criterion Name #n+1 etc"
  #   priority      = 1
  #   and_or        = "and"  # or "or", defaults to "and" if not provided
  #   search_type   = "is"   # or any other supported search type
  #   value         = "Criterion Value"
  #   opening_paren = false  # true or false, defaults to false if not provided
  #   closing_paren = false  # true or false, defaults to false if not provided
  # }

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