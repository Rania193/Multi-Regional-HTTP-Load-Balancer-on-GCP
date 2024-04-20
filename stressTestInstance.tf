data "google_compute_network" "default" {
    name = "default"
  
}
resource "google_compute_instance" "stress_test_vm" {
  name         = "stress-test-vm"
  machine_type = "e2-micro"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }
#   provisioner "file" {
#     source = "./stress_test.sh"
#     destination = "/home/stress_test.sh"
#   }
#   provisioner "remote-exec" {
#     script = "/home/stress_test.sh"
#   }

  network_interface {
    network = data.google_compute_network.default.self_link
    access_config {
    }
  }
  metadata = {
    lb_ipv4 = google_compute_global_address.lb_ipv4.address
}

  metadata_startup_script = <<-EOT
    #!/bin/bash
    sudo apt-get update
    sudo apt-get install -y siege
    LB_IP_V4=$(curl -H "Metadata-Flavor: Google" http://metadata.google.internal/computeMetadata/v1/instance/attributes/lb_ipv4)
    # Stress test IPv4 address
    siege -c 20 -t 5m http://$LB_IP_V4
  EOT
}