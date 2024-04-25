
resource "jamfpro_policy" "policy_testing" {
    name = "Test - Managed by TF"
    enabled = false
    network_limitations {
      minimum_network_connection = "Ethernet"
    }
    
}