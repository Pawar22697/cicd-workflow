# Promact Practical Round

This project demonstrates the deployment of a sample ASP.NET Core application using AWS, Terraform, Docker, and Kubernetes, with CI/CD implemented using GitHub Actions.

## Pre-requisites

Ensure the following binaries are installed on your local machine:

- AWS CLI
- Terraform CLI
- Git
- kubectl

## 1. Infrastructure Provisioning with Terraform

I have created a Terraform script in the `terraform` directory (`terraform/main.tf`). Follow these steps to provision the infrastructure:

1. Navigate to the `terraform` directory.
2. Run `terraform init` to initialize the Terraform directory.
3. Validate the syntax with `terraform validate`.
4. Run `terraform plan` to review the resources that will be created (e.g., VPC, security group, IAM roles, NACL, internet gateway, subnets, EKS cluster, node group, etc.).
5. Apply the changes with `terraform apply`.

## 2. Dockerization of the Sample ASP.NET Core Application

The sample ASP.NET Core application code is located in the `MyAspNetCoreApp` directory. To Dockerize the application:

1. Use the `Dockerfile` available in the code.
2. Build the Docker image using `docker build -t my-image:tag .`.

## 3. Kubernetes Deployment

The `deployment.yaml` file defines the Kubernetes resources required for deployment. Follow these steps to deploy the application:

1. Apply the Kubernetes manifest with `kubectl apply -f deployment.yaml`.
2. Monitor the deployment status with `kubectl get pods -n dotnet-app`.

## 4. Continuous Integration and Deployment (CI/CD) with GitHub Actions

GitHub Actions workflow is configured for CI/CD. The workflow has two jobs:

- **Build:** Builds the Docker image of the ASP.NET Core application and pushes it to Docker Hub.
- **Deploy:** Deploys the application on the EKS cluster using the Docker image built in the previous step.

Note: I have tried my best to cover all the points 

## Contributors
- [Shubham Pawar](https://github.com/Pawar22697/promact.git)
- Gmail: shubhampawar819@gmail.com
