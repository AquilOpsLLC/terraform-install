#!/bin/bash

# Update the apt package index
sudo apt update

# Install unzip (if not already installed)
sudo apt install -y unzip

# Download the latest version of Terraform
TERRAFORM_VERSION=$(curl -s https://api.github.com/repos/hashicorp/terraform/releases/latest | grep tag_name | cut -d '"' -f 4)
wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip -O terraform.zip

# Unzip the Terraform binary
unzip terraform.zip

# Move the Terraform binary to /usr/local/bin
sudo mv terraform /usr/local/bin/

# Verify Terraform installation
terraform --version
