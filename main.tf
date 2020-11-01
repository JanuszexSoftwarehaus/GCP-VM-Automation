provider "google" {
  project = "januszex"
  region  = "us-central1"
  zone    = "us-central1-c"
}

resource "google_compute_firewall" "default" {
  name    = "postgres-firewall"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["9372"]
  }

  target_tags = ["pgfirewall"]
}


resource "google_compute_instance" "vm_instance" {
  name         = "terraform-instance"
  machine_type = "f1-micro"

  tags = ["pgfirewall"]
  boot_disk {
    initialize_params {
      image = "centos-cloud/centos-8"
    }
  }

  network_interface {
    network = "default"
    access_config {
      // Ephemeral IP
    }
  }
  metadata = {
    ssh-keys = "januszex-tf:${file("id_rsa.pub")}"
  }
}

output "ip" {
  value =  google_compute_instance.vm_instance.network_interface
}
