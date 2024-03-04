resource "jamfpro_macos_configuration_profile" "Scope_Test" {
    name = "Resource Scope Testing 1"
    category {
        id = 5
        name = "Applications"
    }
    scope {
        all_computers = false
    }
}
