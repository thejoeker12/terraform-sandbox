
run "valid_jamfpro_policy" {
    command = apply

    assert {
        condition = jamfpro_policy.jamfpro_policy_script_exmaple.name == "JL Testing-1"
        error_message = "the name is not that"
    }
}