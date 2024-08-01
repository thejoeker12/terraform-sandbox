resource "jamfpro_policy" "jamfpro_policy_script_example" {
  name                          = "JL Policy"
  enabled                       = false
  trigger_checkin               = false


  scope {
    all_computers = false
    all_jss_users = false
  }


  payloads {
    scripts {
      id = jamfpro_script.script_for_policy.id
    }
    scripts {
      id = jamfpro_script.script_for_policy_2.id
    }
  }

}

resource "jamfpro_script" "script_for_policy" {
  name = "Test Name"
  script_contents = "echo 'hello world'"
  priority = "BEFORE"
}

resource "jamfpro_script" "script_for_policy_2" {
  name = "Test Name 2"
  script_contents = "echo 'hello Joseph'"
  category_id = 5
  priority = "AFTER"
}

# resource "jamfpro_category" "new_cat" {
#   count = 5
#   name = "100 Categories-s-${count.index}"
#   priority = 5
# }

# resource "jamfpro_building" "test" {
#   count = 10
#   name = "Test Number-s-${count.index}"

# }

# resource "jamfpro_static_computer_group" "jamfpro_static_computer_group_001" {
#   name = "Example Static Computer TEST1"
# }


# resource "jamfpro_department" "test" {
#     name = "Dept - 10"
# }