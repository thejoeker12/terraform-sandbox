resource "jamfpro_macos_configuration_profile" "Scope_Test" {
    name = "Scope Test config profile"
    category {
        id = "5"
        name = "Applications"
    }
    scope {
        computer {
            id = 18
        }

    }   
}

