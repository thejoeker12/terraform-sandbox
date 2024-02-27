
resource "jamfpro_macos_configuration_profile" "Scope_Test" {
    name = "Scope Test config profile"
    category {
       id = 5
       name = "Applications"
    }
    description = "This is the description of the configuration profile"
    user_removeable = false
    level = "User"
    scope {
        computers {
          id = sort([
            15,
            18,
            17
          ])
        }
    }

}
