resource "google_compute_instance" "r1" {
  name    = "r1"
  project = "${var.project}"
  zone    = "${var.zone1}"

  machine_type = "custom-4-4096"

  can_ip_forward = true

  boot_disk {
    initialize_params {
      image = "${var.os["ubuntu-1604"]}"
    }
  }

  network_interface {
    network         = "${google_compute_network.mgmt.name}"
    access_config      = {}
  }

  network_interface {
    subnetwork         = "${google_compute_subnetwork.r3-r1.name}"
    subnetwork_project = "${var.project}"
    access_config      = {}
  }

  network_interface {
    subnetwork         = "${google_compute_subnetwork.r1-r2.name}"
    subnetwork_project = "${var.project}"
    access_config      = {}
  }
}

resource "google_compute_instance" "r2" {
  name    = "r2"
  project = "${var.project}"
  zone    = "${var.zone1}"

  machine_type = "custom-4-4096"

  can_ip_forward = true

  boot_disk {
    initialize_params {
      image = "${var.os["ubuntu-1604"]}"
    }
  }

  network_interface {
    network         = "${google_compute_network.mgmt.name}"
    access_config      = {}
  }

  network_interface {
    subnetwork         = "${google_compute_subnetwork.r1-r2.name}"
    subnetwork_project = "${var.project}"
    access_config      = {}
  }

  network_interface {
    subnetwork         = "${google_compute_subnetwork.r2-r3.name}"
    subnetwork_project = "${var.project}"
    access_config      = {}
  }
}

resource "google_compute_instance" "r3" {
  name    = "r3"
  project = "${var.project}"
  zone    = "${var.zone1}"

  machine_type = "custom-4-4096"

  can_ip_forward = true

  boot_disk {
    initialize_params {
      image = "${var.os["ubuntu-1604"]}"
    }
  }

  network_interface {
    network         = "${google_compute_network.mgmt.name}"
    access_config      = {}
  }

  network_interface {
    subnetwork         = "${google_compute_subnetwork.r2-r3.name}"
    subnetwork_project = "${var.project}"
    access_config      = {}
  }

  network_interface {
    subnetwork         = "${google_compute_subnetwork.r3-r1.name}"
    subnetwork_project = "${var.project}"
    access_config      = {}
  }
}

# resource "google_compute_instance" "eve-ng" {
#   name    = "eve-ng"
#   project = "${var.project}"
#   zone    = "${var.zone1}"

#   machine_type = "n1-standard-8"

#   can_ip_forward = true

#   boot_disk {
#     initialize_params {
#       image = "${var.os["ubuntu-1604"]}"
#     }
#   }

#   network_interface {
#     network         = "${google_compute_network.mgmt.name}"
#     access_config      = {}
#   }
# }