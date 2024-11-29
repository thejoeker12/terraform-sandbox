# resource "jamfpro_script" "script1" {
#   count = 50
#   name = "tf-testing-local-jl-${count.index}"
#   script_contents = "echo hello world"
#   priority = "BEFORE"
#   timeouts {
#     create = "100s"
#     delete = "100s"
#   }
# }