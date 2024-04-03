resource "jamfpro_policy" "policy_testing" {
    name = "test name"
    scope {}
    override_default_settings {}
    self_service {}
    site {
      
    }
    enabled = false
}