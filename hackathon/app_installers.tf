resource "jamfpro_app_installer" "ap_inst_010_editor" {
  name            = "${var.team-prefix}-010 Editor"
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
    notification_interval = 1
    deadline_message      = "Update deadline approaching"
    deadline              = 1
    quit_delay            = 1
    complete_message      = "Update completed successfully"
    relaunch              = true
    suppress              = false
  }

  self_service_settings {
    include_in_featured_category   = true
    include_in_compliance_category = true
    force_view_description         = true
    description                    = "This is an example app deployment"

    categories {
      id       = jamfpro_category.categories["Hardware & Devices"].id
      featured = true
    }
  }
}


resource "jamfpro_app_installer" "ap_inst_pycharm" {
  name            = "${var.team-prefix}-JetBrains PyCharm Professional"
  app_title_name  = "JetBrains PyCharm Professional"
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
    notification_interval = 1
    deadline_message      = "Update deadline approaching"
    deadline              = 1
    quit_delay            = 1
    complete_message      = "Update completed successfully"
    relaunch              = true
    suppress              = false
  }

  self_service_settings {
    include_in_featured_category   = true
    include_in_compliance_category = true
    force_view_description         = true
    description                    = "This is an example app deployment"

    categories {
      id       = jamfpro_category.categories["E-Commerce"].id
      featured = true
    }
  }
}