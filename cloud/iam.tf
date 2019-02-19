
resource "google_service_account" "packersa" {
  account_id   = "packersa"
  display_name = "packersa"
  project      = "${var.project}"
}

resource "google_service_account_key" "packer-key" {
  service_account_id = "${google_service_account.packersa.name}"
}

resource "local_file" "packer-key-file" {
  content  = "${base64decode(google_service_account_key.packer-key.private_key)}"
  filename = "${path.module}/packerkey.json"
}

resource "google_project_iam_binding" "packer-bind" {
  project = "${var.project}"
  role    = "roles/storage.admin"

  depends_on = ["google_service_account.packersa"]

  members = [
    # "serviceAccount:packersa@${var.project_name}.iam.gserviceaccount.com",
    "serviceAccount:packersa@ipspace-networklab-2ef8b744.iam.gserviceaccount.com",
    
  ]
}

