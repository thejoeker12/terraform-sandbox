resource "jamfpro_static_computer_group" "jamfpro_static_computer_group_newlogger" {
  name = "Flattened Test_newlogger"
  assigned_computer_ids = [16]

}

resource "jamfpro_category" "example_category_newlogger" {
  name = "Anoteher name_newlogger"
  priority = 1
}

resource "jamfpro_script" "scripts_newlogger" {
  name            = "tf-example-script-inline_newlogger-rename"
  script_contents = "hello world"
  os_requirements = "13.1"
  priority        = "BEFORE"
  info = "Your script info here."
  notes = ""
  category_id = jamfpro_category.example_category_newlogger.id

}
