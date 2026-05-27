resource "jamfpro_category" "issue_1106" {
  name     = "tf-issue-1106-policy-self-service-drift-2"
  priority = 9
}

resource "jamfpro_policy" "issue_1106_self_service_no_notification" {
  name                          = "tf-issue-1106-self-service-no-notification-2"
  enabled                       = true
  category_id                   = jamfpro_category.issue_1106.id
  frequency                     = "Ongoing"
  network_requirements          = "Any"
  offline                       = false
  package_distribution_point    = "default"
  retry_attempts                = -1
  retry_event                   = "none"
  site_id                       = -1
  target_drive                  = "/"
  trigger_checkin               = false
  trigger_enrollment_complete   = false
  trigger_login                 = false
  trigger_network_state_changed = false
  trigger_startup               = false

  payloads {
  }

  scope {
    all_computers = true
    all_jss_users = true
  }

  # self_service {
  #   use_for_self_service            = true
  #   self_service_display_name       = "tf-issue-1106-self-service-no-notification"
  #   install_button_text             = "Install"
  #   reinstall_button_text           = "Reinstall"
  #   force_users_to_view_description = false
  #   feature_on_main_page            = false
  #   notification                    = false
  #   # notification_type               = "Self Service"

  #   # Repro target for issue 1106:
  #   # notification_type is intentionally omitted. Current provider schema
  #   # defaults it to "Self Service", while Jamf does not return it when
  #   # notification is false, causing a repeat plan diff after apply.
  #   self_service_category {
  #     id         = jamfpro_category.issue_1106.id
  #     display_in = true
  #     feature_in = false
  #   }
  # }
}
