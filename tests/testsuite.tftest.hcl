run "test" {
  command = apply

  assert{
    # condition = jamfpro_script.min_script.script_contents == "script_contents_field"
    condition = jamfpro_script.min_script.priority == "BEFORE"

    error_message = "script contents not correct"
  }
}