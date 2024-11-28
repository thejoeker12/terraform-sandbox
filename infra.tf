resource "jamfpro_script" "script1" {
  count = 50
  name = "tf-test-local-jl-${count.index}"
  script_contents = "echo hello world"
  priority = "BEFORE"
}
