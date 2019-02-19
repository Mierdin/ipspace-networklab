
variable "zone1" {
  default = "us-west1-a" # Oregon
}

variable "zone2" {
  default = "us-west1-b" # Oregon
}

variable "zone3" {
  default = "us-west1-c" # Oregon
}

variable "region" {
  default = "us-west1" # Oregon
}

variable "os" {
  default {
    "ubuntu-1604" = "ubuntu-os-cloud/ubuntu-1604-xenial-v20180522"
    "centos-7"    = "centos-cloud/centos-7-v20180523"
  }
}

variable "zone_domain_name" {
  default = "networkreliability.engineering."
}

variable "project" {
  default = "ipspace-networklab-2ef8b744"
}

variable "project_name" {
  default = "ipspace-networklab"
}
