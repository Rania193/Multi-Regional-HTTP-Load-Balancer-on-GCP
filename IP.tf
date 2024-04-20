# Create IPv4 address for forwarding rule
resource "google_compute_global_address" "lb_ipv4" {
  name = "http-lb-ipv4"
}

# Create IPv6 address for forwarding rule
resource "google_compute_global_address" "lb_ipv6" {
  name         = "http-lb-ipv6"
  ip_version   = "IPV6"
  address_type = "EXTERNAL"
}