locals {
  departments = [
    "Engineering",
    "Product Management",
    "Design",
    "Marketing",
    "Sales",
    "Finance",
    "Human Resources",
    "Legal",
    "Information Technology",
    "Security",
    "Customer Support",
    "Operations",
    "Quality Assurance",
    "Research and Development",
    "Data Science",
    "Communications",
    "Procurement",
    "Training and Development",
    "Facilities",
    "Executive Leadership"
  ]
}

resource "jamfpro_department" "departments" {
  for_each = toset(local.departments)
  name     = "${var.team-prefix}-${each.value}"
}
