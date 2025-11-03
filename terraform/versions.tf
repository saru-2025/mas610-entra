terraform {
  required_version = ">= 1.5.0"

  required_providers {
    databricks = {
      source  = "databricks/databricks"
      version = ">= 1.30.0"
    }
  }
   provider_installation {
    filesystem_mirror {
      path    = "providers"
      include = ["databricks/databricks"]
    }
    direct {
      exclude = ["databricks/databricks"]
    }
  }
}