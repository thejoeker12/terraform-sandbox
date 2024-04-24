
resource "jamfpro_policy" "policy_testing" {
    name = "Test - Managed by TF1"
    enabled = true
    network_limitations {
      minimum_network_connection = "Ethernet"
    }
}