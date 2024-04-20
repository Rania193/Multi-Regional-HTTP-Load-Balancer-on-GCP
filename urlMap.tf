# Create URL map
resource "google_compute_url_map" "http_lb" {
  name        = "http-lb"
  default_service = google_compute_backend_service.http_backend.self_link
}
