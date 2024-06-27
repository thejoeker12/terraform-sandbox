

variable "global_name_prefix" {
    type = string
    default = "tf-fullconfigtest"
  
}

# resource "jamfpro_account_group"  "jamf_pro_account_group" {
#   name         = "${var.global_name_prefix}-accountgroup-1"
#   access_level = "Full Access"
#   privilege_set = "Custom" 

#   jss_objects_privileges = [
#     "Create Advanced Computer Searches",
#     "Read Advanced Computer Searches",
#     "Update Advanced Computer Searches",
#     "Delete Advanced Computer Searches",
#     "Create Advanced Mobile Device Searches",
#     "Read Advanced Mobile Device Searches",
#     "Update Advanced Mobile Device Searches",
#     "Delete Advanced Mobile Device Searches",
#     "Create Advanced User Searches",
#     "Read Advanced User Searches",
#     "Update Advanced User Searches",
#     "Delete Advanced User Searches",
#     "Create Advanced User Content Searches",
#     "Read Advanced User Content Searches",
#     "Update Advanced User Content Searches",
#     "Delete Advanced User Content Searches",
#     "Create AirPlay Permissions",
#     "Read AirPlay Permissions",
#     "Update AirPlay Permissions",
#     "Delete AirPlay Permissions",
#   ]

#   jss_settings_privileges = [
#     "Read Activation Code",
# 	"Update Activation Code",
# 	"Read Apache Tomcat Settings",
# 	"Update Apache Tomcat Settings",
# 	"Read Apple Configurator Enrollment",
# 	"Update Apple Configurator Enrollment",
# 	"Read Education Settings",
# 	"Update Education Settings",
# 	"Read Mobile Device App Maintenance Settings",
# 	"Update Mobile Device App Maintenance Settings",
# 	"Read Automatic Mac App Updates Settings",
# 	"Update Automatic Mac App Updates Settings",
# 	"Read Automatically Renew MDM Profile Settings",
# 	"Update Automatically Renew MDM Profile Settings",
# 	"Read Cache",
# 	"Update Cache",
#   ]

#   jss_actions_privileges = [
#     "Allow User to Enroll",
# 	"Assign Users to Computers",
# 	"Assign Users to Mobile Devices",
# 	"Change Password",
# 	"Dismiss Notifications",
# 	"Flush MDM Commands",
# 	"Flush Policy Logs",
# 	"Jamf Packages Action",
# 	"Remove restrictions set by Jamf Parent",
# 	"CLEAR_TEACHER_PROFILE_PRIVILEGE",
# 	"Renewal of the Built-in Certificate Authority",
# 	"Jamf Connect Deployment Retry",
# 	"Jamf Protect Deployment Retry",
# 	"Send Application Attributes Command",
# 	"Send Blank Pushes to Mobile Devices",
#   ]

# }

resource "jamfpro_account" "jamf_pro_account" {
  name                   = "${var.global_name_prefix}-account-1"
  directory_user         = false
  full_name              = "micky mouse"
  password               = "mySecretThing10" // Password must be at least 10 characters long. password not stored in state
  email                  = "exampleEmailthing@domain.com"
  enabled                = "Enabled"
  force_password_change  = true
  access_level           = "Full Access" // Full Access / Site Access / Group Access
  privilege_set          = "Custom" // "Administrator", "Auditor", "Enrollment Only", "Custom"
#   site_id = 1174

  jss_objects_privileges   = [
    "Create Categories",
    "Read Categories",
    "Update Categories",
    "Delete Categories",
    "Create Directory Bindings",
    "Read Directory Bindings",
    "Update Directory Bindings",
    "Delete Directory Bindings",
    "Create Dock Items",
    "Read Dock Items",
    "Update Dock Items",
    "Delete Dock Items",
    "Create Packages",
    "Read Packages",
    "Update Packages",
    "Delete Packages",
    "Create Printers",
    "Read Printers",
    "Update Printers",
    "Delete Printers",
    "Create Scripts",
    "Read Scripts",
    "Update Scripts",
    "Delete Scripts",
	]
#   jss_settings_privileges  = ["Read SSO Settings", "Update User-Initiated Enrollment"]
#   jss_actions_privileges   = ["Flush Policy Logs"]
#   casper_admin_privileges  = ["Use Casper Admin", "Save With Casper Admin"]

}