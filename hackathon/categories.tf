
locals {
  categories = {
    network  = 1
    storage  = 2
    security = 3
  }
}


resource "jamfpro_category" "categories" {
  for_each = local.categories
  name     = each.key
  priority = each.value

}