resource "jamfpro_macos_configuration_profile" "Scope_Test" {
    name = "Scope Test config profile"
    scope {
        computers {
            id = sort([15, 14])
        }
    }
}