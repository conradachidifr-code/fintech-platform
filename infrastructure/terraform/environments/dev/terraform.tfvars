# AWS Configuration
aws_region = "us-east-1"

# Project Information
project_name = "fintech-platform"
environment  = "dev"

# VPC Configuration
vpc_cidr             = "10.0.0.0/16"
availability_zones   = ["us-east-1a", "us-east-1b", "us-east-1c"]
public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
private_subnet_cidrs = ["10.0.11.0/24", "10.0.12.0/24", "10.0.13.0/24"]

# NAT Gateway - Single NAT for dev to save costs
enable_nat_gateway = true
single_nat_gateway = true

# VPC Flow Logs - Disabled for dev to save costs
enable_flow_logs = false

# EKS Configuration
cluster_version = "1.30"

# Node Groups Configuration
node_groups = {
  general = {
    desired_size   = 2
    min_size       = 2
    max_size       = 4
    instance_types = ["t3.medium"]
    capacity_type  = "ON_DEMAND"
    disk_size      = 20
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

ecr_image_retention_count = 10
ecr_untagged_image_days   = 7

# Tags
tags = {
  Owner      = "platform-team"
  CostCenter = "engineering"
  Terraform  = "true"
}
