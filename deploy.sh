#!/bin/bash

# Navigate to the Terraform directory
cd terraform

# Initialize Terraform
terraform init

# Apply the Terraform scripts
terraform apply -auto-approve

# Get the Droplet IP from Terraform
DROPLET_IP=$(terraform output -raw droplet_ip)

# Navigate to the Docker directory
cd ../docker

# Set environment variables
export DROPLET_IP=$DROPLET_IP

# Deploy the Docker stack
docker -H tcp://$DROPLET_IP:2376 stack deploy -c docker-compose.yml myapp