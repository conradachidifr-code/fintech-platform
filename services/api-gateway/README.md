# API Gateway Service

FastAPI-based API gateway for FinTech Platform.

## Development
```bash
python -m venv venv
source venv/bin/activate  # Windows: venv\Scripts\activate
pip install -r requirements-dev.txt
uvicorn app.main:app --reload
```

## Testing
```bash
pytest
pytest --cov=app --cov-report=html
```

## Code Quality
```bash
black app/ tests/
isort app/ tests/
pylint app/
mypy app/
bandit -r app/
```

## Docker
```bash
docker build -t fintech-api-gateway .
docker run -p 8080:8080 fintech-api-gateway
```
