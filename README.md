# Azure Terraform Infrastructure Project

This project provisions a modular Azure environment using Terraform. It demonstrates infrastructure-as-code patterns including reusable modules, remote state, networking, compute, load balancing, managed database services, storage, identity and RBAC, monitoring, and secret management.

The environment is deployed through the `envs/dev` root module and uses reusable Terraform modules stored under `modules/`.

---

## Architecture

The deployed Azure environment includes:

- Azure Resource Group
- Azure Virtual Network
- Application subnet
- Delegated database subnet
- Network Security Groups for application and database traffic
- Public Azure Load Balancer
- Linux Virtual Machine Scale Set
- Azure Database for PostgreSQL Flexible Server
- Private PostgreSQL networking and Private DNS
- Azure Storage Account
- Blob containers for:
  - Product images
  - Application logs
  - Backups
- Microsoft Entra ID users
- Azure RBAC role assignments
- Azure Key Vault
- Database administrator secret stored in Key Vault
- Log Analytics Workspace
- Azure Blob Storage remote Terraform state

### Traffic flow

```text
Internet
   |
   v
Azure Public Load Balancer
   |
   v
VM Scale Set
Application Subnet
10.20.1.0/24
   |
   | PostgreSQL 5432
   v
Azure Database for PostgreSQL
Database Subnet
10.20.2.0/24