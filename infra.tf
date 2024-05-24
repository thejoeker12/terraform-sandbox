resource "jamfpro_computer_group" "differe2ance" {
  name = file("resource_name/group_name.txt")
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
