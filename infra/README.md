# Infrastructure

This project provisions backing infrastructure two ways:

1. **Terraform** (`infra/terraform/`) — primary, declarative provisioning. Source of truth for infra state.
2. **Docker Compose** (`docker-compose.yml`) — alternative dev-loop path. Mirrors the same images/config for fast local iteration without Terraform state.

These are mutually exclusive at runtime: do not run both simultaneously, as container names will collide.

Containers created by Terraform do not carry Compose project labels, so `docker compose ps` will not list them even while they are running. Use `docker ps` to inspect actual container state regardless of which provisioning path was used.

## Terraform workflow
\`\`\`bash
cd infra/terraform
terraform init
terraform plan -var-file="local.tfvars"
terraform apply -var-file="local.tfvars"
\`\`\`

## Compose workflow (alternative, requires Terraform destroy first)
\`\`\`bash
terraform destroy -var-file="local.tfvars"  # from infra/terraform/
docker compose up -d
\`\`\`