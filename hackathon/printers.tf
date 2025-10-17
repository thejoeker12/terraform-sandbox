locals {
  printers = [
    {
      name          = "HP LaserJet 500 color MFP M575"
      uri           = "lpd://10.1.20.204/"
      cups_name     = "HP_9th_Floor"
      location      = "9th Floor"
    },
    {
      name          = "Canon imageRUNNER ADV C5535"
      uri           = "lpd://10.1.20.205/"
      cups_name     = "Canon_8th_Floor"
      location      = "8th Floor"
    },
    {
      name          = "Brother HL-L8360CDW"
      uri           = "lpd://10.1.20.206/"
      cups_name     = "Brother_7th_Floor"
      location      = "7th Floor"
    },
    {
      name          = "Epson WorkForce Pro WF-7840"
      uri           = "lpd://10.1.20.207/"
      cups_name     = "Epson_6th_Floor"
      location      = "6th Floor"
    },
    {
      name          = "Ricoh MP C4504ex"
      uri           = "lpd://10.1.20.208/"
      cups_name     = "Ricoh_5th_Floor"
      location      = "5th Floor"
    },
    {
      name          = "Xerox VersaLink C405"
      uri           = "lpd://10.1.20.209/"
      cups_name     = "Xerox_4th_Floor"
      location      = "4th Floor"
    },
    {
      name          = "Kyocera TASKalfa 4053ci"
      uri           = "lpd://10.1.20.210/"
      cups_name     = "Kyocera_3rd_Floor"
      location      = "3rd Floor"
    },
    {
      name          = "HP OfficeJet Pro 9025e"
      uri           = "lpd://10.1.20.211/"
      cups_name     = "HP_2nd_Floor"
      location      = "2nd Floor"
    },
    {
      name          = "Canon PIXMA TR8620"
      uri           = "lpd://10.1.20.212/"
      cups_name     = "Canon_1st_Floor"
      location      = "1st Floor"
    },
    {
      name          = "Epson EcoTank ET-4760"
      uri           = "lpd://10.1.20.213/"
      cups_name     = "Epson_Ground"
      location      = "Ground Floor"
    }
  ]
}

resource "jamfpro_printer" "printers" {
  for_each = { for p in local.printers : p.cups_name => p }

  name          = "${var.team-prefix}-${each.value.cups_name}"
  category_name = "No category assigned"
  uri           = each.value.uri
  cups_name     = each.value.cups_name
  location      = each.value.location
  model         = each.value.name
  info          = "Deployed by Terraform"
  notes         = "Auto-generated printer resource"
  make_default  = false
  use_generic   = true
  ppd           = ""
  ppd_path      = "/System/Library/Frameworks/ApplicationServices.framework/Versions/A/Frameworks/PrintCore.framework/Resources/Generic.ppd"
  ppd_contents  = ""
}
