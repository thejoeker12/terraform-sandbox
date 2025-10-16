locals {
  teams = ["team1", "team2"]
}

module "hackathon" {
  for_each = toset(local.teams)
  source   = "./hackathon"
  providers = {
    jamfpro = jamfpro
  }
  team-prefix = each.key
}
