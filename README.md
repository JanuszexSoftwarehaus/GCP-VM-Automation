# TerraformIaC
This repo contains ready to use Terraform templates, to prepare virtual machines ready to host applications.

Requirements:

Terraform CLI

id_rsa.pub file with your public ssh key in main directory

gcloud installed on machine

To run:

Create GCP admin account with admin access to Compute Engine (https://console.cloud.google.com/apis/credentials/serviceaccountkey)

Download `*.json` IAM authentication key file.

Add key to environment variables:
`GOOGLE_APPLICATION_CREDENTIALS={{path_to_key_file.json}}`

Run `terraform init` to init terraform

Run `gcloud auth application-default login` to auth gcloud

Run `terraform plan` to view plan of terraform action.

Run `terraform apply` to create VM in Compute Engine - it will create Centos 8 VM in a GCP Always Free Tier.

You can connect to machine via ssh client januszex-tf@machine_ip

# Ansible - configure VM and install required packages to run DB in Docker

Requirements:

Python 3.7

Ansible

TODO pip3 install docker

To run:

Go to directory `./ansible`

Create `hosts` file with GCE machine IP address

Run `ansible all -m ping -i ./hosts -u januszex-tf` to test ansible connection

Run `ansible-playbook -i ./hosts -u januszex-tf 01-basic-playbook.yml` to execute basic-config playbook

Run `ansible-playbook -i ./hosts -u januszex-tf 03-01-prepare-env-for-postgres.yml` to prepare fresh env to postgres.

Run `ansible-playbook -i ./hosts -u januszex-tf 03-02-install-config-postgres.yml` to execute postgres install and config playbook. IMPORTANT: Change default password to secure one.
