resource "jamfpro_app_installer" "jamfpro_app_installer_001" {
  name            = "010 Editor"
  app_title_name  = "010 Editor"
  enabled         = true
  deployment_type = "SELF_SERVICE"
  update_behavior = "AUTOMATIC"
  category_id     = "-1"
  site_id         = "-1"
  smart_group_id  = "1"

  install_predefined_config_profiles = false
  trigger_admin_notifications        = false

  notification_settings {
    notification_message  = "A new update is available"
    # notification_interval = 0
    # deadline_message      = "Update deadline approaching"
    # deadline              = 0
    # quit_delay            = 0
    # complete_message      = "Update completed successfully"
    # relaunch              = true
    # suppress              = false
  }


}