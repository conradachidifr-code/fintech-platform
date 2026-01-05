# Terraform Infrastructure

This directory contains Terraform configurations for the FinTech Platform infrastructure.

## Structure
```
terraform/
├── modules/           # Reusable modules
│   ├── vpc/          # VPC module
│   ├── eks/          # EKS cluster module
│   └── rds/          # RDS module (future)
└── environments/      # Environment-specific configurations
    ├── dev/          # Development environment
    ├── staging/      # Staging environment
    └── production/   # Production environment
```

## Prerequisites

- Terraform >= 1.5.0
- AWS CLI configured
- kubectl installed

## Usage

### Initialize Environment
```bash
cd environments/dev  # or staging, production
terraform init
```

### Plan Changes
```bash
terraform plan
```

### Apply Changes
```bash
terraform apply
```

### Destroy Infrastructure
```bash
terraform destroy
```

## Configuration

Each environment has:
- `main.tf` - Main configuration
- `var - Variable values (environment-specific)
- `outputs.tf` - Output values

## Backend Configuration

State is stored in S3 with DynamoDB locking:
- Bucket: `fintech-terraform-state-*`
- Lock Table: `terraform-lock`

## Environment Differences

### Dev
- Single NAT Gateway (cost savings)
- Smaller instance types
- Minimal nodes
- Flow logs disabled

### Staging
- Multiple NAT Gateways
- Larger instances
- More nodes
- Flow logs enabled

### Production
- Multiple NAT Gateways (HA)
- Production-grade instances
- Auto-scaling enabled
- Spot instances for cost optimization
- All monitoring enabled

## Adding New Services

To add a new service ECR repository:

1. Add to `ecr_repositories` in `terraform.tfvars`
2. Run `terraform plan`
3. Run `terraform apply`

## Costs

Estimated monthly costs per environment:

**Dev**: ~$180/month
- EKS: $73
- EC2: $60
- NAT: $33
- Misc: $14

**Production**: ~$900/month
- EKS: $73
- EC2: $600
- NAT: $99
- Load Balancers: $50
- Misc: $78

## Troubleshooting

### AWS Provider Schema Timeout Error

If you encounter an error like:
```
Error while loading schemas for plugin components: Failed to obtain provider schema: 
Could not load the schema for provider registry.terraform.io/hashicorp/aws: 
failed to instantiate provider "registry.terraform.io/hashicorp/aws" to obtain schema: 
timeout while waiting for plugin to start
```

Try these solutions in order:

**1. Clear Terraform cache and reinitialize:**
```bash
cd environments/dev  # or your environment directory
rm -rf .terraform .terraform.lock.hcl
terraform init
```

**2. Clear global provider cache:**
```bash
rm -rf ~/.terraform.d/plugin-cache
terraform init
```

**3. Reinitialize with upgrade:**
```bash
terraform init -upgrade
```

**4. Check network connectivity:**
```bash
# Verify you can reach Terraform registry
curl -I https://registry.terraform.io
```

**5. Use provider mirror (if behind firewall/proxy):**
Add to your `main.tf`:
```hcl
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
```

Then set environment variable:
```bash
export TF_PLUGIN_CACHE_DIR="$HOME/.terraform.d/plugin-cache"
terraform init
```

**6. Check Terraform and provider versions:**
```bash
terraform version
terraform providers
```

### State Lock Error
```bash
terraform force-unlock LOCK_ID
```

### Reset Backend
```bash
terraform init -reconfigure
```

### View State
```bash
terraform state list
terraform state show <resource>
```
