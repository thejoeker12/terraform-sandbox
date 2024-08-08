resource "jamfpro_policy" "newpolicy" {
  name = "New Policy 1"
  enabled = false

  scope {
    all_computers = false
    all_jss_users = false
  }

  payloads {
    
  }
}