# ClinicOps - End-to-End AWS DevOps Project (Terraform + GitHub Actions + EKS)

This is a production-grade AWS DevOps project designed to showcase modern Cloud, IaC, CI/CD, and Kubernetes skills.  
Built fully using **AWS**, **Terraform**, **GitHub Actions**, and **Kubernetes (EKS)**.

---

## 🚀 Project Overview

ClinicOps is a fully automated cloud infrastructure setup with:
- AWS S3 + DynamoDB Terraform Remote Backend  
- AWS VPC (production-grade networking)  
- AWS ECR for container images  
- AWS EKS for Kubernetes workloads  
- GitHub Actions CI/CD pipelines  
- Zero-touch deployment with Terraform + Helm  

This project simulates **real-world enterprise DevOps workflows**, focusing on automation, scalability, and security.

---

## ✔️ What is Completed So Far

### 🔹 1. Local DevOps Environment Setup
Installed:
- AWS CLI  
- Terraform  
- kubectl  
- eksctl  
- Helm  

### 🔹 2. GitHub Repository + CI/CD Workflow
- Created repo: `clinicops`
- Added GitHub Actions workflow for Terraform:
  - terraform init  
  - terraform validate  
  - terraform plan  
  - terraform apply (manual only)  
- Uses secure GitHub secrets for AWS access.

### 🔹 3. Terraform Remote Backend
Using:
- S3 bucket: stores Terraform state  
- DynamoDB table: manages state locking  

This setup is identical to enterprise-grade cloud environments.

### 🔹 4. Terraform Skeleton
Added:
- backend.tf  
- providers.tf  
- variables.tf  
- main.tf  
- outputs.tf  

Backend is fully automated and verified through CI/CD.

---

## 🏗️ Upcoming Infra Components (Work in Progress)
- AWS VPC (public + private subnets)
- AWS ECR repository
- AWS EKS cluster
- Kubernetes deployments using Helm
- Monitoring & logging (CloudWatch)
- Automated CI/CD pipeline for container deployment

---

## 🧩 Tech Stack
- **Cloud:** AWS  
- **IaC:** Terraform  
- **CI/CD:** GitHub Actions  
- **Containers:** Docker + ECR  
- **Orchestration:** Kubernetes (EKS)  
- **K8s Packaging:** Helm  

---

## 🎯 Purpose of the Project
This project serves as a complete DevOps showcase demonstrating:

- Terraform best practices  
- Production-grade AWS infrastructure  
- CI/CD automation  
- Kubernetes cluster setup  
- GitHub Actions workflows  
- Secure remote backend  
- Real-world DevOps pipelines  

Perfect for **interview portfolios**, **DevOps resumes**, or **hands-on learning**.

---

## 👨‍💻 Author
**Venkata Sai Krishna**  
DevOps Engineer | Cloud | Terraform | Kubernetes  
GitHub: https://github.com/venkata-sai-creations
