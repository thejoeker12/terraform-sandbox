
module "hackathon" {
  source                                       = "./hackathon"  
  providers = {
    jamfpro = jamfpro
  }
}


import {
  to = jamfpro_category.cheese
  id = 36751
}