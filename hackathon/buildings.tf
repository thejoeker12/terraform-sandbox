locals {
  famous_buildings = {
    "apple_park" = {
      name            = "Apple Park"
      street_address1 = "One Apple Park Way"
      street_address2 = ""
      city            = "Cupertino"
      state_province  = "California"
      zip_postal_code = "95014"
      country         = "United States"
    }
    "googleplex" = {
      name            = "Googleplex"
      street_address1 = "1600 Amphitheatre Parkway"
      street_address2 = ""
      city            = "Mountain View"
      state_province  = "California"
      zip_postal_code = "94043"
      country         = "United States"
    }
    "microsoft_hq" = {
      name            = "Microsoft Headquarters"
      street_address1 = "1 Microsoft Way"
      street_address2 = ""
      city            = "Redmond"
      state_province  = "Washington"
      zip_postal_code = "98052"
      country         = "United States"
    }
    "amazon_hq" = {
      name            = "Amazon Headquarters"
      street_address1 = "410 Terry Ave N"
      street_address2 = ""
      city            = "Seattle"
      state_province  = "Washington"
      zip_postal_code = "98109"
      country         = "United States"
    }
    "tesla_hq" = {
      name            = "Tesla Headquarters"
      street_address1 = "1 Tesla Road"
      street_address2 = ""
      city            = "Austin"
      state_province  = "Texas"
      zip_postal_code = "78725"
      country         = "United States"
    }
    "nasa" = {
      name            = "NASA Headquarters"
      street_address1 = "300 E Street SW"
      street_address2 = ""
      city            = "Washington"
      state_province  = "DC"
      zip_postal_code = "20546"
      country         = "United States"
    }
    "disney" = {
      name            = "Walt Disney Studios"
      street_address1 = "500 S Buena Vista St"
      street_address2 = ""
      city            = "Burbank"
      state_province  = "California"
      zip_postal_code = "91521"
      country         = "United States"
    }
    "intel" = {
      name            = "Intel Headquarters"
      street_address1 = "2200 Mission College Blvd"
      street_address2 = ""
      city            = "Santa Clara"
      state_province  = "California"
      zip_postal_code = "95054"
      country         = "United States"
    }
    "ibm" = {
      name            = "IBM Headquarters"
      street_address1 = "1 New Orchard Road"
      street_address2 = ""
      city            = "Armonk"
      state_province  = "New York"
      zip_postal_code = "10504"
      country         = "United States"
    }
    "facebook" = {
      name            = "Meta Headquarters"
      street_address1 = "1 Hacker Way"
      street_address2 = ""
      city            = "Menlo Park"
      state_province  = "California"
      zip_postal_code = "94025"
      country         = "United States"
    }
  }
}

resource "jamfpro_building" "buildings" {
  for_each = local.famous_buildings
  name            = "${var.team-prefix}-${each.value.name}"
  street_address1 = each.value.street_address1
  street_address2 = each.value.street_address2
  city            = each.value.city
  state_province  = each.value.state_province
  zip_postal_code = each.value.zip_postal_code
  country         = each.value.country
}
