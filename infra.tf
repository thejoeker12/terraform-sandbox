resource "jamfpro_smart_computer_group_v2" "issue_1079_has_operator_ldap_ea" {
  name        = "tf-issue-1079-v2-has-operator-ldap-ea"
  description = "Repro for provider issue 1079: v2 smart groups should accept has for LDAP extension attributes."

  criteria {
    and_or      = "and"
    name        = "IDP - Transitive Group Membership"
    priority    = 0
    search_type = "has"
    value       = "BSG-SomeGroupName"
  }
}
