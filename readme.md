# MAS610 – Azure Data Platform CI/CD

This repository contains Databricks notebooks and Azure Data Factory (ADF) JSON definitions for MAS 610 regulatory reporting.

---

## 🚀 Architecture Overview

* **ADF Dev:** adf-data-platform
* **Databricks Dev:** dbw_analytics_dev
* **GitHub Dev Repo:** saru-2025/mas610-entra
* **Test Environment:** adf-data-platform-test + dbw_analytics_test
* **GitHub Test Repo:** saru-2025/mas610-entra-test

Shared services: **Key Vault (kv-stdataeng)** and **ADLS Gen2 (stdatahubsg)**

---

## 🧩 Repository Structure

```
.github/workflows/          # CI/CD workflows
├── dev-to-test-sync.yml
└── adf-test-deploy.yml
notebooks/                  # Databricks notebooks
├── bronze/
├── silver/
└── gold/
dataset/                    # ADF datasets
linkedService/              # ADF linked services
pipeline/                   # ADF pipelines
trigger/                    # ADF triggers
factory/                    # ADF factory metadata and ARM templates
publish_config.json
```

---

## ⚙️ Dev → Test Promotion Flow

1. Develop in Databricks Dev or ADF Dev.
2. Commit to the `main` branch of `mas610-entra`.
3. GitHub Actions `dev-to-test-sync.yml` copies changes to `mas610-entra-test`.
4. Databricks Test workspace (auto-linked to Test repo) syncs notebooks.
5. `adf-test-deploy.yml` deploys published ADF JSON to ADF Test.

---

## 🔐 Secrets Required (in GitHub → Settings → Actions → Secrets)

| Name                    | Used For                         |
| ----------------------- | -------------------------------- |
| `GITHUB_TEST_TOKEN`     | Push Dev repo → Test repo        |
| `AZURE_CLIENT_ID`       | Service Principal for ADF deploy |
| `AZURE_CLIENT_SECRET`   | SP secret                        |
| `AZURE_TENANT_ID`       | Tenant ID                        |
| `AZURE_SUBSCRIPTION_ID` | Azure subscription               |

---

## 🧠 Developer Notes

* Always create feature branches in Databricks, merge via PR → `main`.
* Do **not** hard-code secrets in notebooks — use Key Vault scope `kv-stdataeng`.
* ADF publishing creates ARM templates under `factory/`.

---

## 🔄 Automation Summary

* **Databricks notebooks** are synced from Dev to Test via GitHub branch linkage.
* **ADF JSONs** are automatically deployed using GitHub Actions YAML.
* The Test environment always reflects the last validated Dev release.

---

## 🛠️ Next Steps

1. Verify Dev and Test repo names in YAML files.
2. Set required secrets in GitHub Actions.
3. Run workflow manually (or commit to main) to validate deployment.

---

**Author:** Saritha Mpragada
**Version:** CI/CD Integrated Setup
**Date:** November 2025
