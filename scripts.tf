resource "jamfpro_scripts" "scripts_0003_JL" {
  name            = "[scpt]-JL-TEST"
  script_contents = "echo 'Hello World!'"
  os_requirements = "13"
  priority        = "BEFORE"
  info            = "Adds target user or group to specified group membership, or removes said membership."
  notes           = "Jamf Pro script parameters 4 -> 7"
  parameter4  = "100" // targetID
  parameter5  = "group" // Target Type - Must be either "user" or "group"
  parameter6  = "someGroupName" // targetMembership
  parameter7  = "add" // Script Action - Must be either "add" or "remove"
  parameter10 = "this is a param"
} 