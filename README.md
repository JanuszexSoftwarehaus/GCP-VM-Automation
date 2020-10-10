# TerraformIaC
This repo contains ready to use Terraform templates, to prepare virtual machines ready to host applications.

Requirements:

Terraform CLI


To run:

Create GCP admin account with admin access to Compute Engine (https://console.cloud.google.com/apis/credentials/serviceaccountkey)

Download `*.json` IAM authentication key file.

Add key to environment variables:
`GOOGLE_APPLICATION_CREDENTIALS={{path_to_key_file.json}}`

Run `terraform plan` to view plan of terraform action.

Run `terraform apply` to create VM in Compute Engine - it will create Centos 8 VM in a GCP Always Free Tier.


# Ansible - configure VM and install required packages to run DB in Docker

Requirements:



To run:

Go to directory `./ansible`