resource "jamfpro_policy" "jamfpro_policy_script_example" {
  timeouts {
    create = "100m"
  }

  name                          = "JL policy 12"
  enabled                       = false
  trigger_checkin               = false
  trigger_enrollment_complete   = false
  trigger_login                 = false
  trigger_network_state_changed = false
  trigger_startup               = false
  trigger_other                 = "EVENT" // "USER_INITIATED" for self service trigger , "EVENT" for an event trigger
  frequency                     = "Once per computer"
  retry_event                   = "none"
  retry_attempts                = -1
  notify_on_each_failed_retry   = false
  target_drive                  = "/"
  offline                       = false
  category_id                   = jamfpro_category.new_cat[4].id
  site_id                       = -1

  network_limitations {
    minimum_network_connection = "No Minimum"
    any_ip_address             = false
  }

  scope {
    all_computers = false
    all_jss_users = false
  }

  self_service {
    use_for_self_service            = true
    self_service_display_name       = ""
    install_button_text             = "Install"
    self_service_description        = ""
    force_users_to_view_description = false

    feature_on_main_page = false
  }

  payloads {
    packages {
      distribution_point = "default" // Set the appropriate distribution point
      package {
        id                          = 367
        action                      = "Cache" // The action to perform with the package (e.g., Install, Cache, etc.)
        fill_user_template          = false     // Whether to fill the user template
        fill_existing_user_template = false     // Whether to fill existing user templates
      }
    }

    scripts {
      id          = 7722
      priority    = "After"
    }

    scripts {
      id          = 7719
      priority    = "After"
    }

    reboot {
    }

  }

}


resource "jamfpro_category" "new_cat" {
  count = 100
  name = "100 Categories-${count.index}"
  priority = 5
}