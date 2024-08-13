resource "jamfpro_policy" "newpolicy" {
  name            = "New Policy 2"
  enabled         = true
  trigger_checkin = true
  trigger_other   = "trigger string"
  frequency       = "Once per computer"

  // If retry event set, retry attemtps should also be set
  retry_event    = "check-in"
  retry_attempts = 5

  // If network_requirements set, network_limitations block also should be set
  network_requirements = "Ethernet"

  network_limitations {
    // any_ip_address defaults back to true if set to false in this config
    any_ip_address             = true
    minimum_network_connection = "Ethernet"
  }

  category_id = 5

  // Test date_time_limitations


  scope {
    all_computers = false

    // This gets set to True in the GUI but the API does not return it as true
    all_jss_users = false

    computer_ids = [15, 16]
  }

  self_service {
    use_for_self_service      = true
    self_service_description  = "ss desc"
    self_service_display_name = "Do A thing"
    install_button_text       = "BOOM1"
    self_service_category {
      id         = jamfpro_category.cats_installers.id
      display_in = false
      feature_in = true
    }

    self_service_category {
      id         = jamfpro_category.cats_helpers.id
      display_in = true
      feature_in = true
    }

  }

  payloads {
    scripts {
      id = jamfpro_script.script1.id
    }


  }

}

resource "jamfpro_script" "script1" {
  name = "Joe Script 1"
  script_contents = "echo hello world"
  priority = "BEFORE"
}

resource "jamfpro_category" "cats_installers" {
  name = "Installers"
  
}

resource "jamfpro_category" "cats_helpers" {
  name = "Helpers"
  
}

import {
  id = 163
  to = jamfpro_category.testcat1
}