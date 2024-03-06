
resource "jamfpro_macos_configuration_profile" "Scope_Test" {
  name = "Resource Scope Testing 5"
  category {
    id   = 5
    name = "Applications"
  }
  scope {
    all_computers      = false
    computer_ids       = sort([17, 18])
    computer_group_ids = sort([53])
    jss_user_ids       = [4]
    jss_user_group_ids = [4]
    department_ids     = [27653]
    exclusions {
      building_ids = [1332]
    }
  }
  self_service {
    self_service_categories {
      id = [12]
    }
  }
}
