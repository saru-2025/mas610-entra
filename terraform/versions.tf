terraform {
  required_version = ">= 1.5.0"

  required_providers {
    databricks = {
      source  = "databricks/databricks"
      version = ">= 1.30.0"
    }
  }
}

# Configure provider installation method
provider_meta "databricks" {
  installation_method = "filesystem"
  mirror_path        = "providers"
}