# Multi-Regional HTTP Load Balancer on GCP with Auto-Scaling Instance Groups

This Terraform configuration sets up a multi-regional HTTP load balancer on Google Cloud Platform (GCP) with auto-scaling instance groups across two regions: `us-east1` and `europe-west4`. The load balancer distributes traffic to the instance groups using a combination of rate-based and utilization-based balancing strategies.

## Overview

The configuration creates the following resources:

- A Virtual Private Cloud (VPC) network named "mynetwork" with two subnetworks in different regions (`us-east1` and `europe-west4`).
- Firewall rules to allow incoming HTTP traffic and health checks.
- Instance templates for each region, using the latest Debian 11 image and a startup script to install and configure an HTTP server.
- Managed instance groups in each region, configured with auto-scaling and auto-healing policies.
- An HTTP health check to monitor the instances.
- A backend service that distributes traffic to the instance groups using different balancing modes.
- A URL map and an HTTP proxy target to route traffic to the backend service.
- A global forwarding rule that forwards incoming HTTP traffic to the proxy.
- Global IP addresses (IPv4 and IPv6) for the forwarding rule.
- A stress test instance that simulates traffic to the load balancer IP address.

## Usage

1. Configure the Google Cloud provider credentials in your local environment.
2. Clone this repository and navigate to the project directory.
3. Run `terraform init` to initialize the Terraform working directory.
4. Run `terraform apply` to create the resources on GCP.
5. After the deployment is complete, the load balancer IP address will be displayed as an output.
6. The stress test instance will automatically start sending traffic to the load balancer IP address for 5 minutes.
