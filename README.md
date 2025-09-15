#Terraform CI/CD on Azure with GitHub Actions

**Course:** DevOps: Infrastructure as Code  
**Professor:** Robert McKenney  
**Lab:** 12 – Terraform CI/CD on Azure with GitHub Actions  
**Team Members:**
- Rohan James Scott – [scot8](https://github.com/scot8)
- Khanhduy Truong – [duytk1](https://github.com/duytk1)

---

## 📦 Project Overview

This lab demonstrates a full CI/CD pipeline using GitHub Actions to automate testing, security checks, and deployment of Terraform-based Azure infrastructure. It also includes daily drift detection to monitor for out-of-band changes.

---

## 🗂️ Project Structure

```
cst8918-w25-lab12/
├── .github/
│   └── workflows/
│       ├── infra-static_tests.yml
│       ├── infra-ci-cd.yml
│       └── infra-drift-detection.yml
├── infra/
│   ├── tf-app/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   ├── outputs.tf
│   │   ├── terraform.tf
│   │   ├── provider.tf
│   │   └── .tflint.hcl
│   ├── tf-backend/
│   │   └── main.tf
│   └── az-federated-credential-params/
│       ├── branch-main.json
│       ├── production-deploy.json
│       └── pull-request.json
├── app/
│   └── .gitkeep
├── screenshots/
│   ├── pr-checks.png
│   └── pr-tf-plan.png
├── .editorconfig
├── .gitignore
└── README.md
```

---

## ✅ Features Implemented

- ✅ Static analysis using `terraform fmt`, `terraform validate`, and `checkov`
- ✅ Integration tests using `tflint` and `terraform plan`
- ✅ Production deployment via `terraform apply` after PR merge
- ✅ Drift detection with automated GitHub issue creation and closure
- ✅ Remote backend with OIDC authentication (no long-lived secrets)

---

## 🧪 Testing the Pipeline

1. Create a new branch (e.g., `infra-elements`)
2. Add resources (like a Virtual Network and Subnet)
3. Push → triggers static tests
4. Create a pull request → triggers integration tests
5. Merge the PR → triggers deployment
6. Verify resources in Azure

---

## 📸 Screenshots

| Workflow | Screenshot |
|----------|------------|
| PR Status Checks | ![PR Checks](./screenshots/pr-checks.png) |
| Terraform Plan | ![Terraform Plan](./screenshots/pr-tf-plan.png) |

---

## 🧹 Cleanup

To remove resources from Azure:
```bash
cd infra/tf-app
terraform destroy
```

---

## 🔐 Secrets Used

| Scope | Secret Name |
|-------|-------------|
| Repo | `AZURE_CLIENT_ID`, `AZURE_TENANT_ID`, `AZURE_SUBSCRIPTION_ID`, `ARM_ACCESS_KEY` |
| Environment: production | `AZURE_CLIENT_ID` (Contributor) |

---
