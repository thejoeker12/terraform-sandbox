
resource "jamfpro_macos_configuration_profile" "Scope_Test" {
  name = "Resource Scope Testing 5"
  category {
    id   = 5
    name = "Applications"
  }
  scope {
    all_computers = false
    computer_ids = sort([15, 17, 18])
    computer_group_ids = sort([53])
    jss_user_ids = [4]
    # jss_user_group_ids = [4]
    building_ids = [1330]
    department_ids = [27551]
    limitations {
      user_ids = [42]
    }
    
  }

}
