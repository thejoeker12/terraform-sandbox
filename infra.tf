
resource "jamfpro_policy" "policy_testing" {
    name = file("policy_name.txt")
    enabled = false
    category {
      id = 5
    }
    scope {
      all_computers = false
      computer_ids = sort([15])
    }
}

# resource "jamfpro_macos_configuration_profile" "tes2t" {
#   name = "A completely new name"
#   scope {
#     all_computers = false
#   }
#   payload = file("/Users/joseph/Desktop/test.mobileconfig")

# }