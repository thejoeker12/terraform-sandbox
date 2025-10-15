locals {
  filedir = "${path.module}/scripts"
  files   = fileset(local.filedir, "*")
}

resource "jamfpro_script" "scripts" {
  for_each = { for f in local.files : f => file("${local.filedir}/${f}") }
  priority = "BEFORE"
  name = each.key
  script_contents = each.value
}

