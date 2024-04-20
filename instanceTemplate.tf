# Create instance templates
data "google_compute_image" "debian_image" {
  family  = "debian-11"
  project = "debian-cloud"
}

resource "google_compute_instance_template" "region1" {
  name_prefix  = "region1-"
  machine_type = "e2-micro"
  tags         = ["http-server"]

  network_interface {
    network    = google_compute_network.mynetwork.self_link
    subnetwork = google_compute_subnetwork.region1.self_link
    access_config {
    }
  }

  disk {
    source_image = data.google_compute_image.debian_image.self_link
  }

  metadata_startup_script = file("startup.sh")
}

resource "google_compute_instance_template" "region2" {
  name_prefix  = "region2-"
  machine_type = "e2-micro"
  tags         = ["http-server"]

  network_interface {
    network    = google_compute_network.mynetwork.self_link
    subnetwork = google_compute_subnetwork.region2.self_link
    access_config {
    }
  }

  disk {
    source_image = data.google_compute_image.debian_image.self_link
  }

  metadata_startup_script = file("startup.sh")
}