# Create instance groups
resource "google_compute_instance_group_manager" "region1" {
  name               = "region1-mig"
  base_instance_name = "region1"
  zone               = "us-east1-b"

  version {
    instance_template = google_compute_instance_template.region1.self_link
  }

  target_size = 2

  auto_healing_policies {
    health_check      = google_compute_health_check.http.self_link
    initial_delay_sec = 300
  }
}

resource "google_compute_instance_group_manager" "region2" {
  name               = "region2-mig"
  base_instance_name = "region2"
  zone               = "europe-west4-a"

  version {
    instance_template = google_compute_instance_template.region2.self_link
  }

  target_size = 2

  auto_healing_policies {
    health_check      = google_compute_health_check.http.self_link
    initial_delay_sec = 300
  }
}