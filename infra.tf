resource "jamfpro_static_computer_group" "jamfpro_static_computer_group_001" {
  name = "Flattened Test"
  assigned_computer_ids = [16]

}

resource "jamfpro_category" "example_category_1" {
  name = "Anoteher name"
  priority = 1
}

resource "jamfpro_script" "scripts_0002" {
  name            = "tf-example-script-inline"
  script_contents = "hello world"
  os_requirements = "13.1"
  priority        = "BEFORE"
  info = "Your script info here."
  notes = ""
  category_id = jamfpro_category.example_category_1.id

}
