# Create firewall rules
resource "google_compute_firewall" "allow-http" {
  name    = "mynetwork-allow-http"
  network = google_compute_network.mynetwork.self_link

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["http-server"]
}
resource "google_compute_firewall" "allow-health-check" {
  name    = "mynetwork-allow-health-check"
  network = google_compute_network.mynetwork.self_link

  allow {
    protocol = "tcp"
  }

  source_ranges = ["130.211.0.0/22", "35.191.0.0/16"]
  target_tags   = ["http-server"]
}
