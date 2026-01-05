# AWS Configuration
aws_region = "us-east-1"

# Project Information
project_name = "fintech-platform"
environment  = "production"

# VPC Configuration
vpc_cidr             = "10.2.0.0/16"
availability_zones   = ["us-east-1a", "us-east-1b", "us-east-1c"]
public_subnet_cidrs  = ["10.2.1.0/24", "10.2.2.0/24", "10.2.3.0/24"]
private_subnet_cidrs = ["10.2.11.0/24", "10.2.12.0/24", "10.2.13.0/24"]

# NAT Gateway - Multiple NATs for high availability
enable_nat_gateway = true
single_nat_gateway = false

# VPC Flow Logs - Enabled for production
enable_flow_logs = true

# EKS Configuration
cluster_version = "1.30"

# Node Groups Configuration
node_groups = {
  general = {
    desired_size   = 10
    min_size       = 10
    max_size       = 50
    instance_types = ["t3.large"]
    capacity_type  = "ON_DEMAND"
    disk_size      = 50
    labels = {
      role = "general"
    }
  }
  
  spot = {
    desired_size   = 5
    min_size       = 0
    max_size       = 20
    instance_types = ["t3.large", "t3a.large"]
    capacity_type  = "SPOT"
    disk_size      = 30
    labels = {
      role = "spot"
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

ecr_image_retention_count = 50
ecr_untagged_image_days   = 1

# Tags
tags = {
  Owner      = "platform-team"
  CostCenter = "engineering"
  Terraform  = "true"
  Compliance = "required"
}
