resource "jamfpro_policy" "policy1" {
  name          = "JL Policy"
  enabled       = false
  trigger_other = "trigger"


  scope {
    all_computers = false
    all_jss_users = false
    computer_ids  = sort([17])
  }


  payloads {

  }
}

import {
  to = jamfpro_policy.policy1
  id = 33
}


# resource "jamfpro_printer" "printer1" {
#   name          = "tf-example-printer-generic_ppd-01"
#   category_name = "No category assigned"
#   uri           = "lpd://10.1.20.204/"
#   cups_name     = "HP_9th_Floor"
#   location      = "string"
#   model         = "HP LaserJet 500 color MFP M575"
#   info          = "string"
#   notes         = "string"
#   make_default  = false
#   use_generic   = true
#   ppd           = ""
#   ppd_path      = "/System/Library/Frameworks/ApplicationServices.framework/Versions/A/Frameworks/PrintCore.framework/Resources/Generic.ppd"
#   ppd_contents  = ""

# }


# resource "jamfpro_dock_item" "dockitem2" {
#   name = "chessTEST"
#   type = "App"
#   path = "/Applications/chess.app"
# }

# resource "jamfpro_script" "script1" {
#   name            = "Install Firefox"
#   script_contents = "echo 'hello world'"
#   priority        = "BEFORE"
# }


# variable "prod_bool" {
#   type    = bool
#   default = false
# }

# resource "jamfpro_script" "script1" {
#   name            = "Test Name - Monday2"
#   script_contents = "echo 'hello Joseph'"
#   category_id     = 5
#   priority        = "AFTER"
# }

