# AI Agent Instructions for MAS610-ENTRA Project

## Project Overview
This is a Terraform-based infrastructure project for deploying and managing Databricks jobs for the MAS610 data pipeline. The project primarily handles the automated deployment of Databricks notebooks and job configurations through Infrastructure as Code (IaC).

## Key Components

### Infrastructure Architecture
- Uses Terraform to manage Databricks resources
- Main job deployment is handled in `terraform/main.tf`
- Infrastructure configuration is centralized in `terraform/variables.tf`
- Authentication uses Databricks PAT (Personal Access Token) configured in provider settings

### Core Resources
- Databricks Job: `MAS610_Bronze_Load`
  - Uses an existing Databricks cluster (specified via variable)
  - Executes the `/Shared/MAS610_Bronze_Load` notebook
  - Configured with email notifications for failures
  - Limited to single concurrent run

## Development Workflows

### Infrastructure Updates
1. All Terraform configurations are in the `terraform/` directory
2. Variables should be defined in `terraform/variables.tf` and set in `terraform.tfvars`
3. Critical variables to consider:
   - `databricks_token` for authentication
   - `existing_cluster_id` for job execution
   - `email_notification` for alerts

### Best Practices
1. Always use variables for configurable values in `main.tf`
2. Maintain the existing job structure pattern:
   - Name convention: `MAS610_[Layer]_[Operation]`
   - Email notifications configuration
   - Max concurrent runs limitation

## Integration Points
- **Azure Databricks**: Main execution environment (host: adb-3086481039813864.4.azuredatabricks.net)
- **Databricks Notebooks**: Jobs reference notebooks in the Shared workspace
- **Email Notifications**: Integrated for job failure alerts

## File Organization
```
terraform/
├── main.tf         # Job definitions and main resource configurations
├── variables.tf    # Variable declarations
├── provider.tf     # Databricks provider configuration
└── terraform.tfvars # Variable values (gitignored)
```

Feel free to request clarification on any of these sections or suggest improvements based on your understanding of the project's needs.