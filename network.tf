# Create a network and subnet for the instances
resource "google_compute_network" "mynetwork" {
  name                    = "mynetwork"
  auto_create_subnetworks = false
}
resource "google_compute_subnetwork" "region1" {
  name          = "region1-subnet"
  ip_cidr_range = "10.0.1.0/24"
  region        = "us-east1"
  network       = google_compute_network.mynetwork.self_link
}
resource "google_compute_subnetwork" "region2" {
  name          = "region2-subnet"
  ip_cidr_range = "10.0.2.0/24"
  region        = "europe-west4"
  network       = google_compute_network.mynetwork.self_link
}