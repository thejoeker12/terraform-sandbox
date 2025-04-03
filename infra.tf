# resource "jamfpro_macos_configuration_profile_plist" "jamfpro_macos_configuration_profile_plist_88" {
#   category_id         = -1
#   description         = null
#   distribution_method = "Make Available in Self Service"
#   level               = "System"
#   name                = "mcp-deploy-Island_IslandEnterpriseBrowserExtensions_base-X.X-prod-eu-0-0"
#   payload_validate    = null
#   payloads            = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<!DOCTYPE plist PUBLIC \"-//Apple//DTD PLIST 1.0//EN\" \"http://www.apple.com/DTDs/PropertyList-1.0.dtd\">\n<plist version=\"1.0\">\n\t<dict>\n\t\t<key>PayloadContent</key>\n\t\t<array>\n\t\t\t<dict>\n\t\t\t\t<key>PayloadContent</key>\n\t\t\t\t<dict>\n\t\t\t\t\t<key>com.google.Chrome</key>\n\t\t\t\t\t<dict>\n\t\t\t\t\t\t<key>Forced</key>\n\t\t\t\t\t\t<array>\n\t\t\t\t\t\t\t<dict>\n\t\t\t\t\t\t\t\t<key>mcx_preference_settings</key>\n\t\t\t\t\t\t\t\t<dict>\n\t\t\t\t\t\t\t\t\t<key>ExtensionSettings</key>\n\t\t\t\t\t\t\t\t\t<dict>\n\t\t\t\t\t\t\t\t\t\t<key>oedggboaecbkcpnmkmdglidmfblggplg</key>\n\t\t\t\t\t\t\t\t\t\t<dict>\n\t\t\t\t\t\t\t\t\t\t\t<key>installation_mode</key>\n\t\t\t\t\t\t\t\t\t\t\t<string>force_installed</string>\n\t\t\t\t\t\t\t\t\t\t\t<key>update_url</key>\n\t\t\t\t\t\t\t\t\t\t\t<string>oedggboaecbkcpnmkmdglidmfblggplg;https://updates.island.io/service/ext?browser_platform=extension&amp;island_tenant_id=lloydsbanking</string>\n\t\t\t\t\t\t\t\t\t\t</dict>\n\t\t\t\t\t\t\t\t\t</dict>\n\t\t\t\t\t\t\t\t</dict>\n\t\t\t\t\t\t\t</dict>\n\t\t\t\t\t\t</array>\n\t\t\t\t\t</dict>\n\t\t\t\t</dict>\n\t\t\t\t<key>PayloadDisplayName</key>\n\t\t\t\t<string>Custom Settings</string>\n\t\t\t\t<key>PayloadIdentifier</key>\n\t\t\t\t<string>181E0CD8-5C8F-43FB-9136-0487B0EB441F</string>\n\t\t\t\t<key>PayloadOrganization</key>\n\t\t\t\t<string>JAMF Software</string>\n\t\t\t\t<key>PayloadType</key>\n\t\t\t\t<string>com.apple.ManagedClient.preferences</string>\n\t\t\t\t<key>PayloadUUID</key>\n\t\t\t\t<string>181E0CD8-5C8F-43FB-9136-0487B0EB441F</string>\n\t\t\t\t<key>PayloadVersion</key>\n\t\t\t\t<integer>1</integer>\n\t\t\t</dict>\n\t\t</array>\n\t\t<key>PayloadDescription</key>\n\t\t<string/>\n\t\t<key>PayloadDisplayName</key>\n\t\t<string>mcp-deploy-Island_IslandEnterpriseBrowserExtensions_base-X.X-prod-eu-0-0</string>\n\t\t<key>PayloadEnabled</key>\n\t\t<true/>\n\t\t<key>PayloadIdentifier</key>\n\t\t<string>EF72FC98-6160-43D3-AA3E-4D3C34F856DE</string>\n\t\t<key>PayloadOrganization</key>\n\t\t<string>Lloyds Bank</string>\n\t\t<key>PayloadRemovalDisallowed</key>\n\t\t<true/>\n\t\t<key>PayloadScope</key>\n\t\t<string>System</string>\n\t\t<key>PayloadType</key>\n\t\t<string>Configuration</string>\n\t\t<key>PayloadUUID</key>\n\t\t<string>EF72FC98-6160-43D3-AA3E-4D3C34F856DE</string>\n\t\t<key>PayloadVersion</key>\n\t\t<integer>1</integer>\n\t</dict>\n</plist>"
#   redeploy_on_update  = "Newly Assigned"
#   site_id             = -1
#   user_removable      = true
#   scope {
#     all_computers      = false
#     all_jss_users      = false
#     building_ids       = []
#     computer_group_ids = []
#     computer_ids       = []
#     department_ids     = []
#     jss_user_group_ids = []
#     jss_user_ids       = []
#   }
#   self_service {
#     feature_on_main_page            = false
#     force_users_to_view_description = false
#     install_button_text             = "Install"
#     # notification                    = false
#     notification_message            = "cheesycake"
#     notification_subject            = "mcp-deploy-Island_IsladddndEnterpriseBrowserExtensions_base-X.X-prod-eu-0-0"
#     self_service_description        = null
#     self_service_display_name       = null
#     self_service_icon_id            = 0
#   }
# }