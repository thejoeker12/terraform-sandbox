resource "jamfpro_policy" "jamfpro_policy_001" {
  count = 25
  name                          = "tf-jl-fixing-bad-defaults-${count.index}"
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
  category_id                   = -1
  site_id                       = -1

  scope {
    all_computers = false
    all_jss_users = false

    computer_ids       = []
    computer_group_ids = []
    building_ids       = []
    department_ids     = []
    jss_user_ids       = []
    jss_user_group_ids = []

  }

  self_service {
    use_for_self_service            = true
    self_service_display_name       = ""
    install_button_text             = "Install"
    reinstall_button_text           = "Reinstall"
    self_service_description        = ""
    force_users_to_view_description = false
    feature_on_main_page            = false
  }

  payloads {
    scripts {
      id          = jamfpro_script.test-payload-script.id
      priority    = "After"
    }

    # reboot {
    #   message                        = "This computer will restart in 5 minutes. Please save anything you are working on and log out by choosing Log Out from the bottom of the Apple menu."
    #   specify_startup                = "Standard Restart"
    #   startup_disk                   = "Current Startup Disk"
    #   no_user_logged_in              = "Do not restart"
    #   user_logged_in                 = "Do not restart"
    #   minutes_until_reboot           = 5
    #   start_reboot_timer_immediately = false
    #   file_vault_2_reboot            = false
    # }

  }

}

resource "jamfpro_script" "test-payload-script" {
    name = "test-script-payload"
    script_contents = "hello world"
    priority = "BEFORE"

}



