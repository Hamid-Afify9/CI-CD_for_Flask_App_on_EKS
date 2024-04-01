# ****CI/CD Pipeline for Flask App on Amazon EKS****

Description:  This project automates the continuous integration and deployment (CI/CD) process for a Python Flask application deployed on Amazon Elastic Kubernetes Service (EKS). It leverages Terraform for infrastructure provisioning, containerization with Docker, and GitHub Actions for the CI/CD pipeline.
Key Features

Automated testing of the Flask application using a chosen testing framework (e.g., pytest, unittest).
Docker containerization of the Flask app for reproducibility and portability.
Infrastructure provisioning on EKS with Terraform, including VPC, subnets, security groups, NACLs, route tables, NAT gateway, and worker nodes.

Deployment of the containerized Flask app to EKS using Kubernetes constructs (deployment, service).
Load balancer configuration for publicly accessible deployment.

Role-Based Access Control (RBAC) authentication with IAM roles and users mapped to RBAC in EKS.
CI/CD pipeline managed by GitHub Actions with three main jobs:
Testing and docker image building/pushing
Infrastructure provisioning, service/deployment creation (with wait for successful deployment)
Rollback and infrastructure deletion

# Getting Started

## Prerequisites: 
An AWS account with EKS cluster configured.
Docker installed and configured.
A GitHub account with a repository for this project ([invalid URL removed]_ Flask_App_on_EKS).
Clone the Repository:
Bash
git clone https://github.com/Hamid-Afify9/CI-CD_for_Flask_App_on_EKS.git
cd CI-CD_for_Flask_App_on_EKS
Use code with caution.
Configure Environment Variables:
Create a .env file in the project root directory .
Add environment variables needed for Terraform, Docker image building (e.g., AWS credentials, Docker Hub credentials), and other configuration settings to be added to GitHub Actions Env Variables.
Example:
AWS_ACCESS_KEY_ID=...
AWS_SECRET_ACCESS_KEY=...
AWS_DEFAULT_REGION=...  # Optional, if not set in AWS credentials
DOCKER_USERNAME=...
DOCKER_PASSWORD=...
...


Create a GitHub Actions workflow file (.github/workflows/cicd.yml) to automate the entire pipeline.
Refer to the documentation for creating workflows: (https://docs.github.com/en/actions)

**Directory Structure**

CI-CD_for_Flask_App_on_EKS/
├── README.md  # This file
├── app/         # Flask application source code
│   ├── main.py
│   └── ...      # Other application files
├── Dockerfile   # Docker build instructions for the Flask app
├── .env         # Environment variables (ignored by Git)
├── run_tests.sh # Optional script to run application tests
├── build_and_push_docker_image.sh # Optional script to build and push Docker image
├── terraform/    # Terraform configuration for infrastructure provisioning
│   ├── main.tf
│   └── ...      # Other Terraform configuration files
└── .github/     # GitHub Actions configurations (optional)
    └── workflows/
        └── cicd.yml  # Optional workflow file for CI/CD pipeline
Explanation:

app/: Contains the source code for your Flask application.
Dockerfile: Defines the instructions for building a Docker image of your Flask app.
.env: Stores environment variables required for Terraform, Docker, and other configurations (ignored by Git).
terraform/: Contains Terraform configuration