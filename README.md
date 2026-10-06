# Azure Terraform Project

This repository is the scaffold for the Azure-only Terraform project.

The implementation will be built incrementally in the `envs/dev` environment and the reusable modules under `modules/`.

## Planned architecture

- Azure Resource Group
- Virtual Network with application and database subnets
- Network Security Groups
- Azure Load Balancer
- Virtual Machine Scale Set
- Azure Database for PostgreSQL with private networking
- Azure Storage containers for product images, application logs, and backups
- Microsoft Entra ID / Azure RBAC principals
- Azure Key Vault
- Log Analytics

## Repository structure

```text
.
├── README.md
├── .gitignore
├── bootstrap/
├── envs/
│   └── dev/
├── modules/
│   ├── network/
│   ├── compute/
│   ├── load-balancer/
│   ├── database/
│   ├── storage/
│   ├── iam/
│   └── monitoring/
└── docs/
    └── screenshots/
```

## Planned Terraform patterns

The implementation should demonstrate:

- Reusable Terraform modules
- Input variables and outputs
- Common Azure resource tags
- `count` and/or `for_each`
- Terraform functions such as `lower`, `replace`, and `merge`
- Azure Blob Storage remote state

## Planned workflow

The project will be implemented one module at a time. This scaffold intentionally contains no deployable infrastructure yet.

Later documentation will cover prerequisites, initialization, planning, applying, destroying, outputs, screenshots, and the project walkthrough video.

## Security rules

Never commit credentials, passwords, real `.tfvars` files, Terraform state, plans, or secret values. Use Azure identity authentication and secret-management services during implementation.
