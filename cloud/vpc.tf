
resource "google_compute_network" "mgmt" {
  name                    = "mgmt"
  project                 = "${var.project}"
  auto_create_subnetworks = "true"
}

resource "google_compute_network" "r1-r2" {
  name                    = "r1-r2"
  project                 = "${var.project}"
  auto_create_subnetworks = "false"
}

resource "google_compute_subnetwork" "r1-r2" {
  name          = "r1-r2"
  project       = "${var.project}"
  ip_cidr_range = "10.12.0.0/24"
  region        = "${var.region}"
  network       = "${google_compute_network.r1-r2.self_link}"
}

resource "google_compute_network" "r2-r3" {
  name                    = "r2-r3"
  project                 = "${var.project}"
  auto_create_subnetworks = "false"
}

resource "google_compute_subnetwork" "r2-r3" {
  name          = "r2-r3"
  project       = "${var.project}"
  ip_cidr_range = "10.23.0.0/24"
  region        = "${var.region}"
  network       = "${google_compute_network.r2-r3.self_link}"
}

resource "google_compute_network" "r3-r1" {
  name                    = "r3-r1"
  project                 = "${var.project}"
  auto_create_subnetworks = "false"
}

resource "google_compute_subnetwork" "r3-r1" {
  name          = "r3-r1"
  project       = "${var.project}"
  ip_cidr_range = "10.31.0.0/24"
  region        = "${var.region}"
  network       = "${google_compute_network.r3-r1.self_link}"
}


resource "google_compute_firewall" "allow-ssh" {
  name = "allow-ssh"

  project = "${var.project}"

  network = "${google_compute_network.mgmt.name}"

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = [
    "0.0.0.0/0"
  ]
}


resource "google_compute_firewall" "allow-dhcp" {
  name = "allow-dhcp"

  project = "${var.project}"

  network = "${google_compute_network.mgmt.name}"

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "udp"
    ports    = ["67"]
  }

  source_ranges = [
    "10.0.0.0/8"
  ]
}

resource "google_compute_firewall" "allow-all-r1-r2" {
  name = "allow-all-internal"

  project = "${var.project}"
  network = "${google_compute_network.r1-r2.name}"

  allow {
    protocol = "all"
  }

  source_ranges = [
    "10.0.0.0/8"
  ]
}

resource "google_compute_firewall" "allow-all-r2-r3" {
  name = "allow-all-r2-r3"

  project = "${var.project}"
  network = "${google_compute_network.r2-r3.name}"

  allow {
    protocol = "all"
  }

  source_ranges = [
    "10.0.0.0/8"
  ]
}

resource "google_compute_firewall" "allow-all-r3-r1" {
  name = "allow-all-r3-r1"

  project = "${var.project}"
  network = "${google_compute_network.r3-r1.name}"

  allow {
    protocol = "all"
  }

  source_ranges = [
    "10.0.0.0/8"
  ]
}