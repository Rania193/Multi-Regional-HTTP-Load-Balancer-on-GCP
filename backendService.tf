# Create backend service
resource "google_compute_backend_service" "http_backend" {
  name        = "http-backend"
  protocol    = "HTTP"
  port_name = "http"
  health_checks = [google_compute_health_check.http.self_link]

  backend {
    group = google_compute_instance_group_manager.region1.instance_group
    balancing_mode = "RATE"
    max_rate_per_instance = 50
  }

  backend {
    group = google_compute_instance_group_manager.region2.instance_group
    balancing_mode = "UTILIZATION"
    max_utilization = 0.8
  }
}
