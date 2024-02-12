resource "jamfpro_macos_configuration_profile" "Scope_Test" {
    name = "Scope Test config profile"
    category  {
        id = 5
        name = "Applications"
    }
    scope {
        computers {
            id = [16, 18, 14, 15, 17]
        }
    }

}
