variable "plist_version_number" {
  description = "The version number of the plist."
  type        = string
  default     = "1.0"
}


resource "jamfpro_macos_configuration_profile_plist_generator" "jamfpro_macos_configuration_profile_plist_generator_004" {
  name                = "tf-localtest-block_notifications-prod-${var.plist_version_number}"
  description         = "System Extension Policy and Notification Settings"
  distribution_method = "Install Automatically"
  user_removable      = false
  level               = "System"

  scope {
    all_computers = true
    all_jss_users = true
  }

  payloads {
    payload_description_header        = "System Extension Policy and Notification Settings"
    payload_display_name_header       = "mcp-deploy-axis_security_ext-0.0.1-prod-eu-0-0"
    payload_enabled_header            = true
    payload_organization_header       = "Deployment Theory"
    payload_removal_disallowed_header = true
    payload_scope_header              = "System"
    payload_type_header               = "Configuration"
    payload_version_header            = 1

    payload_content {
      payload_description        = ""
      payload_display_name       = "System Extension Policy"
      payload_enabled            = true
      payload_organization       = "Deployment Theory"
      payload_type               = "com.apple.system-extension-policy"
      payload_version            = 1
      payload_removal_disallowed = false
      payload_scope              = "System"
      
      setting {
        key = "PayloadContent"
        dictionary {
          key = "com.apple.notificationsettings"
          dictionary {
            key = "forced"
            dictionary {
              key = "mcx_preference_settings"
              dictionary {
                key = "NotificationSettings"
                dictionary {
                  key   = "AlertType"
                  value = 0
                }
                dictionary {
                  key   = "BadgesEnabled"
                  value = false
                }
                dictionary {
                  key   = "BundleIdentifier"
                  value = "com.apple.btmnotificationagent"
                }
                dictionary {
                  key   = "NotificationsEnabled"
                  value = false
                }
                dictionary {
                  key   = "ShowInLockScreen"
                  value = false
                }
                dictionary {
                  key   = "ShowInNotificationCenter"
                  value = false
                }
                dictionary {
                  key   = "SoundsEnabled"
                  value = false
                }
              }
            }
          }
        }
      }

    }
  }
}