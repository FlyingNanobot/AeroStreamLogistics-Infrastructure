# AeroStream Logistics — Developer Onboarding

Welcome to the AeroStream Logistics engineering team!

This guide will help you set up your full local microservices environment using:

- Docker
- k3d (Kubernetes in Docker)
- Kubernetes manifests
- Automated PowerShell scripts

---

## 1. Prerequisites

Install:

- Docker Desktop
- k3d
- kubectl
- PowerShell 7+ (recommended)

---

## 2. First-Time Setup

Run: .\setup.ps1

This will:

- Create the `aerostream` k3d cluster
- Configure ingress
- Add hosts entries

---

## 3. Deploy the Entire Platform

Run: .\deploy.ps1

This will:

- Build all Docker images
- Import them into k3d
- Apply all Kubernetes manifests
- Restart all deployments

---

## 4. Access the System

UI: http://ui.localdev.me
API: http://api.localdev.me/health

---

## 5. Check Status

Run: .\status.ps1

---

## 6. View Logs

Run: .\logs.ps1

---

## 7. Reset Everything

Run: .\destroy.ps1

---

You are now fully set up to develop and test the AeroStream Logistics microservices locally.