# Remote State Bootstrap

This folder contains the one-time Terraform configuration for the Azure Storage Account and Blob container used by the `azurerm` backend.

The bootstrap state must be managed separately from the application environment. Do not place the backend configuration in this folder until the storage resources have been created.

Azure Blob Storage provides state locking through blob leases for the standard `azurerm` backend. The assignment references Cosmos DB for Azure locking, but the standard AzureRM backend pattern uses Blob Storage leases.
