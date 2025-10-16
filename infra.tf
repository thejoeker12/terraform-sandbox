
module "hackathon-team1" {
  source = "./hackathon"
  providers = {
    jamfpro = jamfpro
  }
  team-prefix = "team1"
}

module "hackathon-team2" {
  source = "./hackathon"
  providers = {
    jamfpro = jamfpro
  }
  team-prefix = "team2"
}


moved {
  from = module.hackathon
  to = module.hackathon-team1
}