
resource "jamfpro_policy" "policy_testing" {
    name = "test name"
    enabled = false
    scope {
        all_computers = false
        all_jss_users = false
    }
    override_default_settings {}
    self_service {}

    site {
        id = 0
        name = "none"
    }

    payloads {

        // Packages
        packages {
            package {
                id = 1
                fill_user_template = ""
            }

            package {
                id = 2
            }

            package {
                id = 3
            }
        }
        
        // Scripts
        scripts {
            script {
                id = 1
            }

            script {
                id = 4
            }
        }
    }
}