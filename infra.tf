resource "jamfpro_script" "script1" {
  count           = 2
  name            = "tf-testing-local-jl-5-${count.index}"
  script_contents = "echo hello world"
  priority        = "BEFORE"
}


resource "jamfpro_script" "script2" {
  count           = 5
  name            = "tf-testing-local-jl-6-${count.index}"
  script_contents = "echo hello world"
  priority        = "BEFORE"
}

resource "jamfpro_building" "build" {
  name = "cheese"
#   timeouts {
#     create = "10m"
#   }
}
