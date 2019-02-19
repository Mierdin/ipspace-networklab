resource "google_storage_bucket" "ipspace-labs-customimages" {
  name     = "ipspace-labs-customimages"
  location = "US"

  project   = "${var.project}"
}