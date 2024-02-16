resource "jamfpro_macos_configuration_profile" "Scope_Test" {
    name = "Scope Test config profile"
    # site {
    #     id = 661
    #     name = "jl_test"
    # }
    category {
       id = 5
       name = "Applications"
    }
    # scope {
    #     computers {
    #         id = [
    #             17,
    #             18,
    #             14,
    #             16
    #         ]
    #     }
    # }
}
