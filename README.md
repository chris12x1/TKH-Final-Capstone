# Secure Automated Web Architecture

## Description
This project automates the provisioning of a secure, single-instance web server environment on Amazon Web Services (AWS) using Infrastructure as Code (IaC). It leverages Terraform to build locked-down network and compute resources while incorporating a DevSecOps continuous integration pipeline via GitHub Actions to scan HCL code for security compliance before deployment.

## Technologies Used
* **AWS (Amazon Web Services)**: Cloud infrastructure provider hosting the VPC, subnets, route tables, security groups, and EC2 compute instances.
* **Terraform**: Infrastructure as Code (IaC) tool used to declaratively define and provision cloud resources.
* **GitHub Actions**: CI/CD automation platform executing automated DevSecOps workflows on every code push.
* **tfsec**: Static Application Security Testing (SAST) tool integrated into the pipeline to detect security risks and compliance issues in Terraform HCL code.

## Architecture
The infrastructure is isolated within a dedicated AWS Virtual Private Cloud (VPC) scoped to a `/16` CIDR block and configured with a public subnet (`/24`) tied to an Internet Gateway. Network access is tightly restricted at the firewall layer using an AWS Security Group:
* **HTTP (Port 80)**: Allowed inbound from anywhere (`0.0.0.0/0`) to serve public web traffic via an automated Apache (`httpd`) installation script.
* **SSH (Port 22)**: Restricted strictly to a specific, trusted home IP address CIDR (`/32`) to block unauthorized remote access.
* **Instance Security**: The EC2 instance enforces Instance Metadata Service Version 2 (IMDSv2) to mitigate SSRF vulnerabilities and requires root block device encryption at rest.
