
resource "jamfpro_policy" "policy_testing" {
    name = "Test - Managed by TF"
    enabled = false
    date_time_limitations {
      activation_date = "10/10/2024"
    }
    category {
      id = 5
    }
}

