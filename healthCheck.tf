# Create health check
resource "google_compute_health_check" "http" {
  name = "http-health-check"

  http_health_check {
    port = 80
  }
}