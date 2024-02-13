resource "jamfpro_macos_configuration_profile" "Scope_Test" {
    name = "Scope Test config profile"
    scope {
        computers {
            id = [
                17,
                18,
                14,
                16
            ]
        }
    }
}
