# FinTech Platform

A scalable microservices-based financial technology platform with full CI/CD automation.

## Architecture

This platform consists of:

- **Frontend**: React-based web application
- **API Gateway**: Python FastAPI service
- **User Service**: User management microservice
- **Payment Service**: Payment processing microservice

## Quick Start

### Prerequisites

- Docker Desktop
- Node.js 18+
- Python 3.11+
- Terraform 1.5+
- kubectl
- AWS CLI
- Helm 3+

### Local Development
```bash
# Clone the repository
git clone <your-repo-url>
cd fintech-platform

# Set up frontend
cd services/frontend
npm install
npm run dev

# Set up backend services
cd services/api-gateway
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate
pip install -r requirements.txt
uvicorn app.main:app --reload
```

## Infrastructure

### Deploy to AWS
```bash
cd infrastructure/terraform/environments/dev
terraform init
terraform plan
terraform apply
```

### Deploy to Kubernetes
```bash
cd infrastructure/kubernetes
kubectl apply -k overlays/dev
```

## CI/CD Pipeline

Our pipeline includes:

1. Code quality checks (linting, formatting)
2. Security scanning
3. Unit and integration tests
4. Docker image building
5. Container security scanning
6. Automated deployment to dev/staging
7. Manual approval for production
8. Canary deployments
9. Automated rollback on failure

## Documentation

- [Architecture Overview](docs/architecture/overview.md)
- [API Documentation](docs/guides/api.md)
- [Deployment Guide](docs/guides/deployment.md)
- [Runbooks](docs/runbooks/)

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md)

## License

MIT
