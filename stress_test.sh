#!/bin/bash

# Retrieve Load Balancer IP addresses from Terraform output
LB_IP_V4=$(terraform output -raw lb_ipv4)
#LB_IP_V6=$(terraform output -raw lb_ipv6)

# Stress test IPv4 address
siege -c 200 -t 5m http://$LB_IP_V4

# Stress test IPv6 address
#siege -c 200 -t 5m http://[$LB_IP_V6]