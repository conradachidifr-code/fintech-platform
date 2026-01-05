# AWS Configuration
aws_region = "us-east-1"

# Project Information
project_name = "fintech-platform"
environment  = "staging"

# VPC Configuration
vpc_cidr             = "10.1.0.0/16"
availability_zones   = ["us-east-1a", "us-east-1b", "us-east-1c"]
public_subnet_cidrs  = ["10.1.1.0/24", "10.1.2.0/24", "10.1.3.0/24"]
private_subnet_cidrs = ["10.1.11.0/24", "10.1.12.0/24", "10.1.13.0/24"]

# NAT Gateway - Multiple NATs for higher availability
enable_nat_gateway = true
single_nat_gateway = false

# VPC Flow Logs - Enabled for staging
enable_flow_logs = true

# EKS Configuration
cluster_version = "1.30"

# Node Groups Configuration
node_groups = {
  general = {
    desired_size   = 3
    min_size       = 3
    max_size       = 6
    instance_types = ["t3.large"]
    capacity_type  = "ON_DEMAND"
    disk_size      = 30
    labels = {
      role = "general"
    }
  }
}

# ECR Configuration
ecr_repositories = [
  "frontend",
  "api-gateway",
  "user-service",
  "payment-service"
]

ecr_image_retention_count = 20
ecr_untagged_image_days   = 3

# Tags
tags = {
  Owner      = "platform-team"
  CostCenter = "engineering"
  Terraform  = "true"
}
