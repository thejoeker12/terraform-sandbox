resource "jamfpro_category" "real_cat" {
  name = "I am a real category"

}

resource "jamfpro_category_no_update" "fake_cat" {
  name = "I am a fake category cheese"
}