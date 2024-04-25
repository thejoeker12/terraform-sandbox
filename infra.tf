
resource "jamfpro_policy" "policy_testing" {
    name = "Test - Managed by TF1"
    enabled = false
    network_limitations {
      minimum_network_connection = "Ethernet"
    }
    
}